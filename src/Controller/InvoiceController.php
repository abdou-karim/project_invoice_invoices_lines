<?php

namespace App\Controller;

use App\Entity\Invoice;
use App\Form\InvoiceType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

class InvoiceController extends AbstractController
{
    private $em;

    public function __construct(EntityManagerInterface $em)
    {
        $this->em = $em;
    }

    #[Route('/',name:'addInvoice')]
    public function addInvoice(Request $request){
        $invoice = new Invoice();
        $form = $this->createForm(InvoiceType::class,$invoice);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()){
            $invoice->setCustomerId(rand(1,10));

            $this->em->persist($invoice);
            $this->em->flush();
        }

        return $this->render('invoice/addInvoice.html.twig',[
            'form'=>$form->createView(),
            'invoiceNumber'=>$invoice->getInvoiceNumber()
        ]);
    }


}

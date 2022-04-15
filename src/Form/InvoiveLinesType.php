<?php

namespace App\Form;

use App\Entity\InvoiceLines;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class InvoiveLinesType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('description',TextareaType::class,
            [
                'label'=>"Description",
                'attr'=>['class'=>'form-control m-3']
            ])
            ->add('quantity',NumberType::class,
                [
                    'label'=>"Quantity",
                    'attr'=>['class'=>'form-control m-3']
                ])
            ->add('vatAmount',NumberType::class,
                [
                    'label'=>"VAT Amount",
                    'attr'=>['class'=>'form-control m-3']
                ])
            ->add('totalWithVat',NumberType::class,
                [
                    'label'=>"Total with VAT",
                    'attr'=>['class'=>'form-control m-3']
                ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => InvoiceLines::class,
        ]);
    }
}

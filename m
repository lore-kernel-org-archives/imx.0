Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C084D3BAD8D
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 09:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773309243; cv=pass; b=lWDuo4NpB4YngGZDb0vthMjytwqkH0cSZ0oT08/l23JNGA9TkA/SpZ7Qj1euJwslmlcxayCDvPxtv76pxoIuNvhDBqEorsJ+URLbEmL6GqqNEPjRwq7cwGWkOj3IHby0rHXlygTobd1gW4B9xOtsTeGiZoGuzR/0h0UJ39IELSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773309243; c=relaxed/simple;
	bh=KrV1H2NLInpKlc/gmuUp2Q3dWu4kreAEUmzL94kC14k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CuwoaeNVKl4Ik0gGmfgikr7Zt3X2tFxPTBUiNoRurPDMgVa3kIQ7kZTbrIeXdzHys5nXIShaCzAey17P/rGKEiwnwb2NHZmCoX2sKzDhXmHI3ASRRDAbPF3YU5YKGWXkqQGMEaZNN2Iuhkg7zjgQjKo5460MoJQ0tejErIAjXgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RJx+P633; arc=pass smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RJx+P633"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c737d3a51bdso319356a12.3
        for <imx@lists.linux.dev>; Thu, 12 Mar 2026 02:54:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773309240; cv=none;
        d=google.com; s=arc-20240605;
        b=KDqi/tT9o+4ryP12hEl/ihtHTz7rN0z+SL+KGqzhvQVxrYrOkrx1+oAT/lB3ch+eV/
         HJ4L5zMUuY1V70y7sx+T8ZYQAafB1vVfUD8AW8t+F5jeIfFvqLrB0Jom791/XQRBD0O6
         +uThfe8sSC/VmUCij+yq+fOwruziES6pZutJhLiwPvt2qtgrNF0UZOafryaFLfQaRnpX
         mBHgh3pwM9RgJ7KWWgfkbiDgD+uXpajFZiwXsqiYTclWp1zvuQnXExiOIOW9djfmZ/Vj
         uaygeEO0Kh+LwgexcyXr1fsb0JRBKFjX/FH+vVV8LkZzADj42z90/WP6wheN+ScmPreB
         9qeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pu5XIQSGCkSF/OV0YlHjxKCm6okhTIDdYRaAvJzmT7M=;
        fh=+/oof5YWLsae4hW1ObSl3K48fyBif0gGOk96jhwyPtI=;
        b=Tr12qILf1Hp6c+Y0jKU7s6+KJpwYgiGd80+gsPjaO3907zAfASi/qnR7q99ENDJnVK
         fvJH17KmePWz8VpHbf+hWGRok2zkXqyhXdyHA6WKgbJrs1uFa754V0dBQv+r1WaNLJF+
         XKKo4fb6XlFsvG12nljBAOTT8Ts5cj1gvvuPegfvLrQFNrkJMxTPXAeimPETcursmbPp
         Id+y3LC7GNcbo+1JcLEr8GmBsrBhnSVHX1fdwWFIbhLnh/qonFOPAiM7JwHGOtrHNRwK
         ARdAm8BrXQsMEj/tFYX3drNSW8/AZBCb0Yt6hj2LA1F7lmeTrhC24NuZ+n7ETbeKXBu+
         faRg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773309240; x=1773914040; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pu5XIQSGCkSF/OV0YlHjxKCm6okhTIDdYRaAvJzmT7M=;
        b=RJx+P6335ngxX+jdH61riJYfIT5HtB3Bur3WvRmVeGEGAI7KPsxMziQABMI9wTBWSU
         1hJwXUAWqCAHc0d/tbN4lhC6uMRO3nGT5PNISx/e/Nxp0rfxDH0EbiIEMUHdQesxCYO0
         uAy6a3mPmV/aTDDGqxtlvFSyHP8GB3Syw0bw07AB+PLyjqqIbilm0HKPMcfLNWP+ZfMl
         7H+zXEotHg6cZxnFchygVYEU9vkW+uazkFiHe/JJlm7HmmRKFTpTCvYsjaiTnhPYZhXe
         rYKf2OhhvKKRuJt+ngPPErGcK2OnjzkxI9Fdia1oG/c4uGrrw2PIdy+1XJLCh3NiyypJ
         HjyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773309240; x=1773914040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pu5XIQSGCkSF/OV0YlHjxKCm6okhTIDdYRaAvJzmT7M=;
        b=LG9EIDoZgQD9bZQ/UsZntsquqaASCGSCMVr4F1PZ8h2rXBKHLjS/3XM+GtT//Q4q3O
         9Orp++i0hq4y30/izs4VbP+jIS/Yj7d06WdV4TlcqXjCsrqr4k+70P5HcHSOCKiz0YlZ
         yAWWe4bMRXVYlvNokGuf59VJb6MorEeU6xnjW7y40YnfppR0JM8UNg8oByDRWTElOjn8
         Teqilo3sP1rogRx8jtxY+gRVsF4KRdmzSAgemwtMZ88rz+hT5CG8d5MLWwL+hTbgoftE
         GetU1ml4Kpl+0g34x2Qt0F8QnKvXfKGgOUSEBv3H49th4u4mANjAl6Q7gx1Mp/9mgmbp
         1Fdw==
X-Forwarded-Encrypted: i=1; AJvYcCWWcjgqoHzv4iX5Tx7sWj3d929hl0NY+BoWU+ugBRJT7Y68R3GCY3k+MOdE6DsgLUYxBaM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzpX/kBOMqD+e/Zy9y1yFazSAVApDJeIjRF9IQAc0lHK/SaJzip
	Ck/hmRSoRX4QAk0xTDWRtoJoeI8ILthVY9t3EX3ZrxAbxq47zbj476g+L00J7c0e0DXoCKU5ha+
	NErUlGwfBriCFDPLbOt7m7ZwSt9MyxcE=
X-Gm-Gg: ATEYQzwJqPvMLU0np3s8mimT+ceGhGsEXO0tUOFWQUVDZqPojayxEK9cowmZAbrpg3Y
	9rfBylLbdBN0WSB3gFaM7xtgZeEi0gRGfcbQWrx7cGxJvsFUEybjE+uCr49358aAt2E1TZi48wH
	e6vdbGlDl92B6NgAPmVVx0PJmALvDzmRizmcjWDG5BTUxw1MpiWBeeFpihIOq4NQXwIX3K28i48
	kyWfPlQISm3BdAe5FWyi88+QZpQDCYP75ntNlPULFd3JC7diFU+W0NtpUqG/gSuK/DvXBKS7jFf
	ZFKdEnWOw8eKI8em1g==
X-Received: by 2002:a17:902:e950:b0:2aa:d506:d189 with SMTP id
 d9443c01a7336-2aeae89463fmr59366865ad.34.1773309239948; Thu, 12 Mar 2026
 02:53:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260312034912.4007057-1-shengjiu.wang@nxp.com>
 <20260312034912.4007057-2-shengjiu.wang@nxp.com> <af948fb4-4f63-4276-9368-9d41e80c3e7c@oss.nxp.com>
 <CAA+D8AO2-C8kRiF3ymYd7fvAL_Op5ohwk=m8ZbfjHUWXCSn_3g@mail.gmail.com> <8b4f6c08-9d4a-4af6-80a3-9e3a351ce451@oss.nxp.com>
In-Reply-To: <8b4f6c08-9d4a-4af6-80a3-9e3a351ce451@oss.nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 12 Mar 2026 17:53:42 +0800
X-Gm-Features: AaiRm52mG1WKwAEkIuooQ_iRETrNiaYWjlFWELMoCo_5r-yCY-ygySmvazvcFFw
Message-ID: <CAA+D8APVjeyPEypiJYXJLWEf6ye6c3EPb=DKBfLnBxOYoNGUOg@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: imx952: Add audio device nodes
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 3:10=E2=80=AFPM Daniel Baluta <daniel.baluta@oss.nx=
p.com> wrote:
>
> On 3/12/26 08:54, Shengjiu Wang wrote:
> >> On 3/12/26 05:49, Shengjiu Wang wrote:
> >>> Add audio device nodes, include SAI, MICFIL, ASRC, Audio Mixer.
> >>>
> >>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> >>> ---
> >>>  arch/arm64/boot/dts/freescale/imx952.dtsi | 199 ++++++++++++++++++++=
++
> >>>  1 file changed, 199 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/freescale/imx952.dtsi b/arch/arm64/b=
oot/dts/freescale/imx952.dtsi
> >>> index 0f86b5626cdd..5787c12e788f 100644
> >>> --- a/arch/arm64/boot/dts/freescale/imx952.dtsi
> >>> +++ b/arch/arm64/boot/dts/freescale/imx952.dtsi
> >>> @@ -823,6 +823,156 @@ usdhc3: mmc@42c40000 {
> >>>                       };
> >>>               };
> >>>
> >>> +             aips5: bus@43000000 {
> >>> +                     compatible =3D "fsl,aips-bus", "simple-bus";
> >>> +                     reg =3D <0 0x43000000 0 0x800000>;
> >>> +                     #address-cells =3D <1>;
> >>> +                     #size-cells =3D <1>;
> >>> +                     ranges =3D <0x43000000 0x0 0x43000000 0x800000>=
;
> >>> +
> >>> +                     asrc1: asrc@43000000 {
> >>> +                             compatible =3D "fsl,imx952-asrc";
> >>> +                             reg =3D <0x43000000 0x10000>;
> >>> +                             interrupts =3D <GIC_SPI 376 IRQ_TYPE_LE=
VEL_HIGH>;
> >>> +                             clocks =3D <&scmi_clk IMX952_CLK_BUSWAK=
EUP>,
> >>> +                                      <&scmi_clk IMX952_CLK_BUSWAKEU=
P>,
> >>> +                                      <&scmi_clk IMX952_CLK_ASRC1>,
> >>> +                                      <&scmi_clk IMX952_CLK_ASRC2>,
> >>> +                                      <&clk_dummy>,
> >>> +                                      <&clk_dummy>,
> >>> +                                      <&clk_dummy>,
> >>> +                                      <&clk_dummy>,
> >>> +                                      <&clk_dummy>,
> >>> +                                      <&clk_dummy>,
> >>> +                                      <&clk_dummy>,
> >>> +                                      <&clk_dummy>,
> >>> +                                      <&clk_dummy>,
> >>> +                                      <&clk_dummy>,
> >>> +                                      <&clk_dummy>,
> >>> +                                      <&clk_dummy>,
> >>> +                                      <&clk_dummy>,
> >>> +                                      <&clk_dummy>,
> >>> +                                      <&clk_dummy>;
> >>> +                             clock-names =3D "mem", "ipg",
> >>> +                                           "asrck_0", "asrck_1", "as=
rck_2", "asrck_3",
> >>> +                                           "asrck_4", "asrck_5", "as=
rck_6", "asrck_7",
> >>> +                                           "asrck_8", "asrck_9", "as=
rck_a", "asrck_b",
> >>> +                                           "asrck_c", "asrck_d", "as=
rck_e", "asrck_f",
> >>> +                                           "spba";
> >>> +                             dmas =3D <&edma2 97 0 0>, <&edma2 98 0 =
0>, <&edma2 99 0 0>,
> >>> +                                    <&edma2 100 0 1>, <&edma2 101 0 =
1>, <&edma2 102 0 1>;
> >> For consistency we should use symbolic macros for directions like you =
did below.
> >> Use FSL_EDMA_RX for rx direction and also introduce FSL_EDMA_TX for tx=
 direction.
> > Yes, should use FSL_EDMA_RX.
> >
> > But introduce FSL_EDMA_TX, it should be zero,  FSL_EDMA_TX =3D 0.
> > is it necessary to add it in include/dt-bindings/dma/fsl-edma.h?
>
> I would say yes. For consistency with FSL_EDMA_RX and also for
>
> code readability.
>
> A user doesn't know that 0 means TX.
>
> We could go on and merge this patch as is right now, no problems. And com=
e back later
>
> with a set of cleanup patches that do this for all dtses.

I think it is better to have another patch set to introduce
FSL_EDMA_TX for all dtses.

I will add FSL_EDMA_RX in the next version.

Best regards
shengjiu Wang
>
>

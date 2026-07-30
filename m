Received: from mail-m49200.qiye.163.com (mail-m49200.qiye.163.com [45.254.49.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0451036A340
	for <imx@lists.linux.dev>; Thu, 30 Jul 2026 04:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785384441; cv=none; b=M7iVTZ/n4TVm0EU9LWN/E9UThGAu/a504fWen7kITFkSG0k6+S6HKNMWN75KTaQvfh0hiEnDxeOfRa0LMlYQwbIPi6N1XZTxe5tkPnMRubqHglayGpeEBjF62i5p3gW666BgCCi7h8M362N033+HVzwkInevlminzb2YcEFACnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785384441; c=relaxed/simple;
	bh=hcwOydZtLLbDDRhCFxr27cUxWlNGAcdn2080Ocrk3nk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mt0OBBOy7nvjHzNpYCXYArMwjcLcrduzvkz+lzIcUyjjjqKilvCob1tLKNUq033rzwdo0l3IatRAJihRS/SrwWQ7l2+sefdROlwifRWImJBjaboye2dItdJj23TC541fuurHQqsTZzi5yMFkiy/uQXEt1DZOiumQF9ZfQaLOhLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=LxfXREz7; arc=none smtp.client-ip=45.254.49.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="LxfXREz7"
Received: from tsdl-HP-EliteDesk-880-G6-Tower-PC.. (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 481c9b915;
	Thu, 30 Jul 2026 11:31:42 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: Frank.Li@nxp.com,
	andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	festevam@gmail.com,
	hongyang.zhao@thundersoft.com,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	rosh@debian.org
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: qcs6490-rubikpi3: Add 3.3 V output supply
Date: Thu, 30 Jul 2026 11:31:33 +0800
Message-ID: <20260730033133.63823-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ad142a95-ffcd-46fa-8d55-b3328bc00e20@oss.qualcomm.com>
References: <ad142a95-ffcd-46fa-8d55-b3328bc00e20@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9fb113f1b109d5kunmc26dca11408bbf
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGEtCVkhJQkNJHUhIH0hMTFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVCQk
	lOS1VKS0tVSkJLQlkG
DKIM-Signature: a=rsa-sha256;
	b=LxfXREz7/oJn1rTqqBe7zYYcNmwJmZHwqlClRstYIi0c3doYORY0AN+nEIVzvOmwe/lEL4jYoNjnkQcxgXUnsF4PaEtQ2wUicCjH2B11+UdzUArtRtdOseABWpfboUwCdVcLKmnoxSVnBzi0B9DlCj9yaPtYfmn3ZSrWy0FovIQ=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=CpM9Y/DW/rPww6MoRecMawp94vW2lyXOoX1QBOllpIk=;
	h=date:mime-version:subject:message-id:from;

Thanks for the review!

On 7/22/26 6:12 PM, Hongyang Zhao wrote:
> > Describe the GPIO-controlled VCC3V3_OUTPUT rail. This board-level rail
> > supplies the two camera connectors and the 40-pin expansion header.
> >
> > Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> > ---
> >  .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 24 ++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> > index d8a9a7e47bdc..45514918562b 100644
> > --- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> > +++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
> > @@ -214,6 +214,23 @@ vreg_usbhub_rest_1v8: regulator-usbhub-rest-1v8 {
> >  		regulator-boot-on;
> >  	};
> >
> > +	vreg_vcc3v3_output: regulator-vcc3v3-output {
> > +		compatible = "regulator-fixed";
> > +
> > +		regulator-name = "vcc3v3_output";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +
> > +		gpio = <&tlmm 14 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +
> > +		pinctrl-0 = <&vcc3v3_output_en>;
> > +		pinctrl-names = "default";
> > +
> > +		regulator-always-on;
> > +		regulator-boot-on;
>
> Is it really on by default at boot?

Before submitting the patch, I measured GPIO14 and found that it was
already high before the kernel started, so I described the regulator
as regulator-boot-on.

I have now checked the bootloader code and confirmed that it does not
drive GPIO14 high. According to the schematic, GPIO14 is actually pulled
high by VREG_L18B_1P8.

Therefore, I will remove regulator-boot-on in the next revision of the
patch series while retaining Bryan's Reviewed-by tag.

Thanks,
Hongyang

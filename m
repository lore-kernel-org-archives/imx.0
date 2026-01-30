Received: from mx-relay36-hz2.antispameurope.com (mx-relay36-hz2.antispameurope.com [94.100.136.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E71E34EF1E
	for <imx@lists.linux.dev>; Fri, 30 Jan 2026 09:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.136.236
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769764329; cv=pass; b=EuhCGDKkHyBTEFbNdNKXNP+ZQ3uV1l6wOVx37FBrBuqGuqafJG+WeVAUSzbQfG0zXIlriWXirrGl+gORGwGkqVx+B3X2wXLpyWUEXgYB+dHxMqcsyp/vM+5IqqUFEIabVxyZwuCsM4Qo0r9DqHQPsmlaYmsUEz6cK9iQixLA/Uo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769764329; c=relaxed/simple;
	bh=JJ6ZgfjzIHBLd6Y+kOxT96PhgvFLGLY3oKWCw1HaN/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S9EIBq85dMQ/YJELa7NZTm2KapNdgdvo47l7NnMl0raUb6E0amR/VM9TkoShlH+7Oe6taJTgnp+8bN4B9Nn2vh4oTCxkDYkvd1n5hRHNRrzcxnioJHG09MFn9pVmWRoiNPF4y7S9QsZY19X0Axv2Ym2wwQIwV+4H2MQoruDq5uY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=J6FHxA04; arc=pass smtp.client-ip=94.100.136.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="J6FHxA04"
ARC-Authentication-Results: i=1; mx-gate36-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=OlaaAEdyH/nGPP2TYnuTAVW6ys1F2ggjuG22tntgfjs=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1769764241;
 b=pnX8huHdNxX7XdY2uneAcuTkXkupok7YqJKgVgUPFh/o4qTKbpEOHaQj+LS8oDNZ3deBwfOQ
 XP8TNT+Q9o2AU4NiaE5SrM+DszmP5JGNDFyodEh9nnc8GijFsuPe75cnZLqyxgE6GoHDzj6Vf5S
 1tFfETn1oJ2MYaN5WsUEKEWF3+LMCmIfm4iXYPZvxNeP01ks2VZGvQM5I2f4A/0r06IVqlQESd5
 c0bW6HL9t6qOTgevDjFlOFUYGK5u0Dzt5oz9QY+zvUqyRS48ytWdGYfDocj16NhdqoC2/qynhQR
 IkQ1FFF1ItP2+rRTEMaCPTHp0eemcfWnxZDD9e59JZR+g==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1769764241;
 b=Bgu2JkhCRdtSYoWCyUTDX7SB+tuIrR7jE6l9J9E8wTZGPc8KPdL1jds2EKRk+BVPhwd4Ihji
 00E7OS2bq/mbSvkXElYqTQe0ZPLOUB+/kg2aH0Fiec5jU06u5yFjnCBExGjndaHuNmg9+1OEvZn
 aVUw+6Q8I1SljsGpY6JuKvLPBgQcexL603Aad70s8HkPhsHTVkUtkNbpalRmYzPUdtIMVJxpaYn
 HAdcr2NJ+UxkeEdD/afAzSnCuQ4vLyBexvGdmtzFWz/8XoY+BWnmTsSY3FEkS+fe2B3cjL4dCEz
 VUVcfqGbFRNMsJdd3O1C4r44NUe7FNFSoBmj/TqXbl+Lw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay36-hz2.antispameurope.com;
 Fri, 30 Jan 2026 10:10:41 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id DEE09A40EF0;
	Fri, 30 Jan 2026 10:10:22 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
 benjamin.gaignard@collabora.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, sebastian.fricke@collabora.com,
 shawnguo@kernel.org, ulf.hansson@linaro.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 l.stach@pengutronix.de, Frank.li@nxp.com, peng.fan@nxp.com,
 eagle.zhou@nxp.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ming.qian@oss.nxp.com
Subject:
 Re: [PATCH] arm64: dts: imx8mq: Restore VPU G2 clock to 600MHz for 4K60fps
 decoding
Date: Fri, 30 Jan 2026 10:09:46 +0100
Message-ID: <5476502.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260130084133.2159-1-ming.qian@oss.nxp.com>
References: <20260130084133.2159-1-ming.qian@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay36-hz2.antispameurope.com with 4f2VbN1GXyz1S63D
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:f72694e440bb7dafe036a5498634db5d
X-cloud-security:scantime:2.180
DKIM-Signature: a=rsa-sha256;
 bh=OlaaAEdyH/nGPP2TYnuTAVW6ys1F2ggjuG22tntgfjs=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1769764240; v=1;
 b=J6FHxA04mEnSbNoUgOeWxXdAm5W1pOMTB+BM+w9+Nmio9eB/4JLvmS1HBCnA1UOjyK5O8CTh
 QTX8Qrxdxg5o3Bvw06nG71TaYJsSuPTuM1/4WeKnVUynb+VHmlg52xQknNnhiADrJUulVXpXQfG
 07iwEKyqwrPwwtcbcyxKLqJYCL5tgu9QulSKwkf8znqVEuOpzf97Gj/N2yYEcSJqsoupWdDVJL5
 mvmh/XanULn0rXUc5SIYc7i02Sq9Sqy9q52b+ZvwIVd4oUb1hJzWOzyN6Y7eOpOG8qCteBMN2vm
 k2Jd4A2bE/C2XzDpNA39fBrqTLUOXucSSA7Ho6bre5V+Q==

Am Freitag, 30. Januar 2026, 09:41:31 CET schrieb ming.qian@oss.nxp.com:
> From: Ming Qian <ming.qian@oss.nxp.com>
> 
> The VPU G2 clock was reduced from 600MHz to 300MHz in commit
> b27bfc5103c7 ("arm64: dts: freescale: Fix VPU G2 clock") to address
> pixel errors with high-resolution HEVC postprocessor output.
> 
> However, testing shows the 300MHz clock rate is insufficient for
> 4K60fps decoding and the original pixel errors no longer occur at
> 600MHz with current drivers.
> 
> Test results with 3840x2160@60fps HEVC stream decoded to NV12
> (the same scenario that exhibited pixel errors previously):
> 
> 300MHz performance:
> - Severe frame dropping throughout playback
> - Only 336 frames rendered in 11:53 (0.471 fps)
> - Continuous "A lot of buffers are being dropped" warnings
> - Completely unusable for 4K video
> 
> 600MHz performance:
> - Smooth playback with only 1 frame dropped at startup
> - 37981 frames rendered in 10:34 (59.857 fps)
> - Achieves target 60fps performance
> - No pixel errors or artifacts observed
> 
> Restore the clock to 600MHz to enable proper 4K60fps decoding
> capability while maintaining stability.
> 
> Test pipeline:
>   gst-launch-1.0 filesrc location=<4K60_HEVC.mkv> ! \
>     video/x-matroska ! aiurdemux ! h265parse ! \
>     v4l2slh265dec ! video/x-raw,format=NV12 ! \
>     queue ! waylandsink
> 
> Fixes: b27bfc5103c7 ("arm64: dts: freescale: Fix VPU G2 clock")
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> index 607962f807be..731142176625 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -960,7 +960,7 @@ pgc_vpu: power-domain@6 {
>  									 <&clk IMX8MQ_SYS1_PLL_800M>,
>  									 <&clk IMX8MQ_VPU_PLL>;
>  						assigned-clock-rates = <600000000>,
> -								       <300000000>,
> +								       <600000000>,

If I read the Datasheet correctly 600 MHz is only supported by overdrive
mode (also depending on the VDD_VPU).
Is this frequency really correct?

Best regards,
Alexander

>  								       <800000000>,
>  								       <0>;
>  					};
> 
> base-commit: c824345288d11e269ce41b36c105715bc2286050
> prerequisite-patch-id: 0000000000000000000000000000000000000000
> 





Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8B63C7DFB
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 16:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773420303; cv=none; b=Xp9PgwwWh6Wa+R/4Bh28l4UjBfQpabI6iFkVq2uLQ+/VpJe7eTy8Z06FRayU9vmKMITltYfVhYULJuBWjPTCiNPpCpRvQW92ZNxIyJ8pjS2xFQ6m4cVnSJXQAbnEiFc3IQmBJy5QDYKberkD7HphalC2SpEHvPt6ZoKHAVGgO5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773420303; c=relaxed/simple;
	bh=2km+XikPyiPxhJlMKZaPHBMiGbe4Chw5Q8ygoyMi6k0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=I6E97Zn5S6/O5q0zZxt2Mck1WSwwcvjmlHIBQ74armeXCyNF4lAYqpl2xrOeQKr625zk4PiKNxjPbW66ACvfXmUbLPd9FKCknEobZeV2hmSvs5j+WPq2n+V8rjLpotrH+CUFXOA4zuvvIqZmHwJUWtyV2Fmtr3Kfwr9jNNuK+XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=uaRRE+Ty; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="uaRRE+Ty"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fXVhW0s03z9v0n;
	Fri, 13 Mar 2026 17:44:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773420299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KLgV40T/B5NlziDwzPAutV6VZ7YQTKYRqnGFSFRfQeU=;
	b=uaRRE+TyW/kGoof96aMLEw6YPZrk4MOUpQ9fitT7pCA5mQQytcEO0AhpnO7YD95ciEV7Gt
	9A1xVGWLWCjHFCZizY7aPnXPjmqRzhCnJMNrO66miB9r+xV5JW3XF/vAybT2ZjlKecUD4B
	0kNM/sGpBSAhMTd8UBri1omNlSmnDfD6zgNJS8hNAPZSXam5mZK4vvUQlx8jTggOyJhk1u
	gN2vukyZPeCqDwtPJmeREeCa1qSKlF4RQp8F0pCWfLRn8rS2cHa1PoA16eNQ+x9BpUuHzG
	rwGKe3xOyo3HVDDWb2T9PvICCrfMSD2O7yxMIbSCaVqP74LWXfat8L/416hILw==
Message-ID: <2313c717-1729-48a2-8fc7-63b68ce0a0e6@mailbox.org>
Date: Fri, 13 Mar 2026 17:44:52 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: imx8mp-dhcom-pdk3: Use symbolic macro for
 IOMUXC_SAI2_TXC__GPIO4_IO25
To: Eduard Bostina <egbostina@gmail.com>, daniel.baluta@nxp.com,
 simona.toaca@nxp.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Marek Vasut <marex@denx.de>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260309181524.39423-1-egbostina@gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260309181524.39423-1-egbostina@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: wfqcmx73jwyxskcys17yhqsdtf6eaeid
X-MBO-RS-ID: 3636750f7ea4df0c0c2

On 3/9/26 7:15 PM, Eduard Bostina wrote:
> Currently, in order to configure IOMUXC_SAI2_TXC__GPIO4_IO25 a magic
> raw value is written in this register. This makes the code not obvious
> to read and modify.
> 
> Use the MX8MP_SION symbolic macro instead of the magic value to improve
> code readability.
> 
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> ---
>   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts
> index ef012e8365b1f..6ad824a7e07e0 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts
> @@ -345,7 +345,7 @@ &pinctrl_dhcom_l
>   
>   	pinctrl_ptn5150: ptn5150grp {
>   		fsl,pins = <
> -			MX8MP_IOMUXC_SAI2_TXC__GPIO4_IO25		0x40000000
> +			MX8MP_IOMUXC_SAI2_TXC__GPIO4_IO25		MX8MP_SION
Isn't the SION bit at the same bit offset at least since iMX5x ? Maybe 
the MX8MP_* prefix isn't necessary ?

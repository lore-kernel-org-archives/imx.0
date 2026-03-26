Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68C639C626
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 04:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774499310; cv=none; b=jFI5PGfh1v/OfPsh9CxnAlN7wFnnpdwUA9Ej0qdfiUod3MH1jzMJhVPAwgc5yX3aOTgvdpXsOS6RksjfTeZd24LrmV1XtCHwEq1ExJmqk1RjvM3Es/C1L21pjWPwotV06lItho9f2jHoLzSMxVgM2hywTlxHFEkLp9xJ6Ob5FHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774499310; c=relaxed/simple;
	bh=MfeCrWnZI6Chf+c6NFu44lpjGhI2Fvkl128+VJIXsHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LBfE1H4gelTO/a8lGyvtHaeeShsNS/OEJdhhLySRXVN8glSdde/VEU4ClSR+VmLCpJhyu/uTVWCSGLxdpnlCY1TqTjcj0dGJnLa56wnqnqhBuK7tlLl4kZ9P+ptRnPG/+utVVt2t/Tytc237Kx9jAB6ItLK6kIO5LDlm73AHoZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=AjaK5I7B; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="AjaK5I7B"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7526511235B;
	Thu, 26 Mar 2026 05:28:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1774499300;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=L8MoVHmnri3Cl6KqI9p0QwU1t7f2UmlqeymbhBedSQk=;
	b=AjaK5I7BFXMnFI+2HcRDawC/xob/VQ748J5RHgRbK9FLPWVJAtFvIPdyzojUsHATfSkonD
	84Ms/M70WkiQV79UxjekOE2hMsc6KxPV2q90HU6F29rpPB95vRVRa4MCQzNCWp1H2sJlvC
	22lWXixYleZz7ZUL160jpXngAtAPeaxbSNU76GZaAGSC5MtYC4DcjkNid2f3y3aSuT/Bg0
	jLUP/0RoETGqSwVPRAYIpUQ0vhaKe/758QHD8jwWD4odLVAV9vZiCNngvoeNzXW3CE68eT
	A2Nta6wLH3YRrBDQOdpGnDsnbDFHAeKbKlZW3H/BBRJn/4l3MXhxyK2Mwz9JcQ==
Message-ID: <49b82956-4ec8-4602-9aaa-0d6a2a612fca@nabladev.com>
Date: Thu, 26 Mar 2026 05:28:15 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: imx8mp: Add DT overlays for DH i.MX8M Plus
 DHCOM SoM and boards
To: Frank Li <Frank.li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, kernel@dh-electronics.com,
 linux-kernel@vger.kernel.org
References: <20260324190544.74531-1-marex@nabladev.com>
 <acQqc1AuCa1Tkb-w@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <acQqc1AuCa1Tkb-w@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 3/25/26 7:33 PM, Frank Li wrote:

Hello Frank,

>> +#define DH_OVERLAY_PANEL_I2C_BUS			i2c5
>> +#define DH_OVERLAY_PANEL_I2C_TOUCHSCREEN_PINCTRL	&pinctrl_dhcom_b &pinctrl_dhcom_h
> 
> This is not straight forward.
> 
> you can add label like panel_i2c at dts file.
> 
> panel_i2c: &i2c5 {
> }
> 
> in overlay file use
> 
> &panel_i2c {
> 	....
> }
> 
> So you use the same overlay file for difference dts. The same as others
I did that in V3, thanks.

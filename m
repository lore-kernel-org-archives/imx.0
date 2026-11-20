Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171768;
	b=4wHl6SdAZaKBOeTftPv8GAoGnw9Mb3LThQPxLpsotJtCh1OxjQ9DMnt2ifX3/hv4rH6w
	 zm2Pbdl+MaY+WcGJMvqG+mh2NpwS00EYBHUO/s0oYypL9/XyxWyDW2B61bpB0ing8zysN
	 lQJWomvH1fM6KV59eFheHiQ/Dk/OVjpACrxeijgSTd0VqWCDZNm9P1hJ48BnlfwSGXdmF
	 +blHpq0rkLBky8R5QbJsvWRqnmAkkEHQuFj3mdJIsaMuLWImCpp4DT0yBFx+NSPTSp1JF
	 fp32rUoxYZiR/teJ4XRlpXuY1cdUjKVQRad97Ge9OQXBeBwPc/m8YgA/jaX60FAVV3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=hZruxycw3HvIlDBCBri6p6ZxzTaJWuc5gr86QEFctfY=;
	b=2CoK06U7XnP3Ba/82AmXMBl49ChuHxprqVPoCKBNYPcM7d36hDwPAKAkzepeg+hZY1Mg
	 TVNzYMxbPrZ7D1bqOwx2XauTK+WBXK7zkLuvi+whQxLYbyGTVISFRRC/tM6KbO13Qmsy5
	 suFAEDPKlErmLT266yHOyGuz5kVSgHwDWIDm2w07lCkNJFSQe5gogU14enjJkpA401EMH
	 23YJMF1lQX+f7OjeBrJPHpMyJ8kSlca6NE8NDR9itX/4MPnOD45bTMxjNF2R8LoEK/RqT
	 pXPbZAG9Lq1fCtrWt9b4Xcq7Q/cV4jHF+Qf4ADJbCflPL9FMe9O3tYepdOwiUO6R+Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PHLCM2wF;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD5B606A325
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 10:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BD5B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PHLCM2wF
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so604417b3a.0
        for <imx@lists.linux.dev>; Fri, 20 Nov 2026 02:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795171767; x=1795776567; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hZruxycw3HvIlDBCBri6p6ZxzTaJWuc5gr86QEFctfY=;
        b=PHLCM2wFb3GDkskcpjxGWZZwtwjuLWiZbNUCpt4Xy9QtZZVgB4An6dMsTWkFjtkR99
         GfMv2j3MH9bOlueP02XIHC8y/24iYJhXchvnEA2UqKk/7rW/8ZpEcZGUrBgKHOP4cumn
         sVPHqtC2L35vDCxIhL0Owe7dyJppLpOrhzdzeFfSZ1aKuZdXBWnUClHKFVnuF4ZnbH5/
         UPEYBpzG2/cPDp07tQueJsv4JscGcljssR1i+iFx5g2AK5Kyo3h9cNsQDDRAeMldAFwK
         Ef+G7vjKVRA0RTnK3tBgBMkU42C77flKaTxz4ywwKpt6yjDNwKELKJ2RlDA1j3PtFZ0V
         o/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171767; x=1795776567;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hZruxycw3HvIlDBCBri6p6ZxzTaJWuc5gr86QEFctfY=;
        b=FLTcvbRlaM6x28fXPB/bDCKbxhhfS4xC13GWnAAhqA6ZZ6s9LBIH+gEZI7ThKu3P5S
         CQaH44G1oDr1RIOmOb/oRKeoDGPzpgn3VxUSrB/TP6nZrTHH9zbiivSOqCiYMNHHTFrt
         rQhFuuZDYcL4Oq8KXE+RUe8GXmlrX66KeiUWUT3mlWcdkWjrFHU8Oxxdthl3NOG07SlF
         GVUmORCU9+9FeQhF4DvehBl3k6zS8RyUIxkoRUL65egzbHL72QcFGwMjR/4nbC8WIqS0
         9d9huBYvEEEuwY4TFTSp5vLwwn/MztUP5pk+O0w9Z7BB8mu2ls+G4nY3f1n15sjmnOfA
         HvCw==
X-Forwarded-Encrypted: i=1; AL+hErHEmkX9xe8d21Tog8nnTfp2spxJ17jzeNU32yMCvoD5349Hh4mT5yWHq8KoEyb/cjcoH7Q=@lists.linux.dev
X-Gm-Message-State: APuU4Z+jrHS3PMTctTvMVgdYfZjuhGmUYbxBquW6wA2Q3XpEvsyzDDsN
	K+CyGOgaV+1txBa43frDaY6OTIqves5pdD7td2/zB96o6Yx6nyoWJ6wJ
X-Gm-Gg: AZFdTZcEwXJ2c0IBK006gNG7AvJMvAZWTR4RaygA677lXn5rFwICbrOglUcdxDTO7PM
	/X4xYHjifk6CQpqx4u1bVNRfaTj7vn6T3uK7knmtoWvlWPpRBlvklG4XK1eL9NLgmPBjLU3o1rQ
	vvg2XFChPWYu/liTN5jDYEQEpBb4nu75SKAvitItnDjy8jykaxwTdEATerc9n96IufdB5bUQxlq
	pawYlqCL3N6N+hHFeXX7KbKR8EFVBW28vY4MWiJSnaQ1j9ZBYCGA55gUWqsZmxNrsvTwJv1Ww94
	lmIRuUE3LwCq6V22aZsaRZwA37e6IQKx9QbFyvvjpwjHqm8sCvhLk23zUF4RruaiBXcc/ElFEMx
	EJtVY/k0Ou+LC3d51l1lk8pGwycXD9T+JdaK3ogwZcgipW7lWd1IWK6/DvA3wzDBLjQwrBc65P+
	0trx27dGHpU4PHNWGAcJvzumYnyFuIP2ISfWE5822NZq2aaCCLpLYjnJI4Bw25e93XLpAmHoll6
	vrv8a/E7EuV37+eyD/bSZxAwa1X7pQXDkA7G+eodwpEYMUIybpV3bfh0/zIPFdkvqYXaAYoztRj
	QFN/HCg4cPvuYGh4Ktypdo9CySgHBCfVlMxjZSP2fkd3r6mV
X-Received: by 2002:a05:6a00:1ac9:b0:899:74d0:8a58 with SMTP id d2e1a72fcca58-8c87d11f274mr2712547b3a.55.1795171767464;
        Fri, 20 Nov 2026 02:49:27 -0800 (PST)
Received: from [10.25.164.32] ([128.77.72.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e45e32sm1292915b3a.24.2026.11.20.02.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:49:27 -0800 (PST)
Message-ID: <7f51f7fa-7e81-404a-9b0b-44efbc38cdd6@gmail.com>
Date: Fri, 20 Nov 2026 18:49:21 +0800
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: imx95-19x19-frdm-pro: Add DMIC codec to
 replace dummy codec for micfil
To: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
 daniel.baluta@nxp.com, chancel.liu@nxp.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20261120031853.1175454-1-shengjiu.wang@oss.nxp.com>
 <20261120031853.1175454-8-shengjiu.wang@oss.nxp.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20261120031853.1175454-8-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/20/2026 11:18 AM, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The "fsl,imx-audio-card" machine driver uses a dummy codec by default
> which does not allow configuring the channel number according to the
> board design. Replace it with a proper "dmic-codec" node configured
> for 2 channels to match the DMIC hardware layout on the board.
> 
> Fixes: 815fe2e0e65b ("arm64: dts: freescale: add i.MX95 19x19 FRDM PRO board dts")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Chancel Liu <chancel.liu@gmail.com>

Regards,
Chancel Liu

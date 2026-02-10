Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1F033F38A
	for <imx@lists.linux.dev>; Tue, 10 Feb 2026 14:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770733211; cv=pass; b=L1gvEA0bOo33o4PE0CHCO3lyhOIBVuaVqz0uCUfjmi3QO82ETA8ui6SsCbA/Kl45UpSsci4c5dKAiUJyX2DCHniTmG3KahmtYNUcpVGXkoHefWPKfosfnu147PlbZ1aATrLdmqiAR94HDT2QaUneYJascqMDFpHjWis1H57m7nI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770733211; c=relaxed/simple;
	bh=HWAPDOPHGsIADIUA/tNycOqyhfgD2V6TuXz+MSfX++c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ud9xauwSZkb0EGOmJufon5CBjV3NDZ/lc7e1FeLQfRnIb8909VmLva5GLoywbkYaQM5930oqpWAGbDAsVRTUCIQMtD+ZfIUxBShT0UU4u/Rp0f3LP8ICdQwUVg+QVPRgTl5/5WFqGfi5UUfpmlSk4nQgavA0Ab9l/bBmupJOVhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQeY9nVo; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQeY9nVo"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1271257ae53so1041700c88.1
        for <imx@lists.linux.dev>; Tue, 10 Feb 2026 06:20:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770733208; cv=none;
        d=google.com; s=arc-20240605;
        b=ToelJkscdWKL+zPKiGld+Vi9bNYMxscJWdBuRii9V5r073vMnsGEV1CnGKmxtJ+TiI
         POvqdlPhhLb2H+DHOvAQUNSclId6xiiwbsJhWTMo6TCiYgcrE0kSAZV2S+jAxOvTDGkD
         NNEvDSH+7nlkKA1I4W1tUQAuiSe8K2MnCnmM1Yd7SEChrHFHvSQP9xQAhsPMADTOdRn8
         QhyZnCGrnPfTsqtmk+f7Dw4F2bTaz4+/sh9SIA0GAYmJAgkIXQh7XUNDKBQ+nf9Tp28j
         UOPbxsNZ+kVPbkGEZcDap8AU3u8lsXmUs4HOprzA7ZGmgh8oL7jjfOcgyosHv0qyKMZi
         A51Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HWAPDOPHGsIADIUA/tNycOqyhfgD2V6TuXz+MSfX++c=;
        fh=lykE5oXp0BdunykCQ/q7gNP82KTydiepnKRXnmH74sQ=;
        b=SQhA4zlab1QE8x8eaQofyhajR1bKYFLdTz3m6+m5Rd+47U2Zvuxfw96sgvkvP83XZJ
         e1euao6OBE7oMpyCJHW7HTwd9RgQlS9QmthdN+NwL36wbAZZBV1/EzPvd+mRdPfMXBRt
         AmNUIB7EWXcsh2l7iZ/8uwHhXfp3LbxiJWy2F1aj2tAPJ2k5a43qinq152T93EB1cUFl
         AQgaA/U20nCJOOGZ37ZGBPvJGb8QMuNi1TU6EgLiR5SKoV9gPLLNCNYPXRzRFLIFMOir
         DMYFVov/++rKRrsELHYS59H04IPWgIcNsm/sz+AF8whTmAgpLwM/h6xP9ni9yX2A7TIT
         gVsQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770733208; x=1771338008; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWAPDOPHGsIADIUA/tNycOqyhfgD2V6TuXz+MSfX++c=;
        b=MQeY9nVooRXL7ROdNBXffkhWnAN4TWYTbAlY/MAYPedQajUd2p9z7XlWivh2px9vyP
         99UcvgTF8tOnRd+4s5py2P86DaNiNArw5MVSOFwJ6p/vztvDdVB14ntyjAR7Z9fAEUaX
         fksU/A+sP1vSjcWt7Y74XNhQ0z8HExOZs4J2y02YIsCKkaEOzbUVRUgLatQrbY+z0sI0
         MBaoZu4PXyYt7Vf04+ckn17IK9NNHIksy7Z4+065+glaaZ/GtZysDByQ6XILDIvArnDU
         YbUGwVbfqnUDtBh8XQu86YLrN0HiiZ5N7bDDBPUiELb/eSo6OUUdR8VuPlMFaEXPK7hi
         mwSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770733208; x=1771338008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HWAPDOPHGsIADIUA/tNycOqyhfgD2V6TuXz+MSfX++c=;
        b=F+pb8CG5SAeRJeaCjWXw3CVSF0zjU7xbRPRIQF1tyToQjE/4sS9/uYjcrIBh+vNSw3
         TKet+QmFHlMGCpb1Lpyt+82FvOqAgN9QgQwitu/V2TLNjWZQz6Rg1w84JArw5XNURaNc
         1Ql/GeiCySnYfeFm2jXxlVryWupWv6He553XFPKi0YKP19jmndVQITN1g6JqWNM1DDOe
         2Xk/cruRZsVNTnDDH8Z+bRJEA0xXn2NCmby3w7LDBTQl7mYurGco7mx/al0YEAxqSNBI
         SD98byZ7aDa8F/KfqA4efz/W++uo2gfZ3KvEnbYjQd7LgDRMVANyikfCEif87FqRQ74n
         PyBA==
X-Forwarded-Encrypted: i=1; AJvYcCWybBTq4g9SjsGRBMt0nTl5nbGOpb3+OqWMfL/RUQDv5j06Tv7pl7xOBWmZ3ZdYrGNZ54g=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzr+ukX0pjp9RXYAhTWinR/umQX2ZI2CA98MVXR/6mZUD365LA4
	cBhijI6XVtHjNA7pBgr1DLNP11cNzvdw/BkdXHpFnEGlprPdKCuCCcXbynaHyBaob87RzbR0M4X
	vfFFNaWSPJB0Knts048O9MGANASgW2luwfRZBwnM=
X-Gm-Gg: AZuq6aJAT0irkYzvaF5NpNy5dF0QSAUf3/e70ddKpRAcjhcgZNglR27YIorduIcKbQg
	0wfH4Im41xmllhS2SIweKo+dDEwcvgsVAlAtP//Gv2UQ8ZDCBmBH+56F9WXXZ1SKO9JrZ9ZQJCD
	tQJ7WKkK7ndWsSuXNr9aoudso67Z2banBl5av0GmrmsGd+o3gbvtiDnNLkknaJxxDM19c3351v2
	ge6GSzlvCUvfDCAVkEhgO8/6kVAYFzcrtpUeOHQGqgNwtCxTrFiTJE3gE80xnCpj0wMYijHuQsX
	p5tVmttOlmxkTmozUZJGgaGjhyE57eXZe2z5mcbt58c8cBN83WiQOHIKFF9VhgZ7yd5uGnwLWhg
	3rmJ+Zeiv/IFI9ADIon+nXg==
X-Received: by 2002:a05:7022:699f:b0:11f:3483:bbb2 with SMTP id
 a92af1059eb24-12704010c61mr6241858c88.12.1770733208182; Tue, 10 Feb 2026
 06:20:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260210-imx91s-frdm-v5-0-b3e9a67d2285@nxp.com> <20260210-imx91s-frdm-v5-2-b3e9a67d2285@nxp.com>
In-Reply-To: <20260210-imx91s-frdm-v5-2-b3e9a67d2285@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 10 Feb 2026 16:22:51 +0200
X-Gm-Features: AZwV_Qi9nzL8plrh9S_oCJOUxLkKzuCBMraJPAzRuE6y3RzYD0VAbIX8BlC4J5w
Message-ID: <CAEnQRZCXwJUz5rw0dWP_rVbjw=ianqADbjXaX=fPvmMY+C6KRg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] arm64: dts: freescale: add NXP FRDM-IMX91S board support
To: Yanan Yang <yanan.yang@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, qijian.guo@nxp.com, 
	justin.jiang@nxp.com, Lei Xu <lei.xu@nxp.com>, Xiaofeng Wei <xiaofeng.wei@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 12:49=E2=80=AFPM Yanan Yang <yanan.yang@nxp.com> wr=
ote:
>
> Add DeviceTree support for the NXP FRDM-IMX91S development board based
> on the i.MX91 SoC. FRDM-IMX91S is a cost-optimized variant of FRDM-IMX91
> and differs in memory, storage, Ethernet, and PMIC configuration:
>
> - 512MB LPDDR4 (FRDM-IMX91 uses 1GB)
> - 256MB FlexSPI-NAND (FRDM-IMX91 uses 8GB eMMC)
> - Single GbE port (FRDM-IMX91 has dual GbE)
> - PMIC PF9453 (FRDM-IMX91 uses PCA9451A)
>
> This DT enables:
> - ADC1
> - UART1 and UART5
> - I2C bus and children nodes
> - USB and related nodes
> - uSDHC1 and uSDHC2
> - FlexSPI NAND flash
> - Watchdog3
> - Ethernet (eqos)
> - FlexCAN
> - MQS
>
> Link: https://www.nxp.com/design/design-center/development-boards-and-des=
igns/FRDM-IMX91S
> (FRDM-IMX91S board page)
> Link: https://www.nxp.com/design/design-center/development-boards-and-des=
igns/FRDM-IMX91
> (FRDM-IMX91 board page)


Tested-by: Daniel Baluta <daniel.baluta@nxp.com>

Used your patches on top of linux-next 20260209 and managed to boot the boa=
rd
using serial downloader and rootfs via nfs.

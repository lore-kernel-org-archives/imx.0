Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBF52BE7B4
	for <imx@lists.linux.dev>; Thu, 23 Oct 2025 16:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761236430; cv=none; b=hLGo9g28pvXgXHtIDNXqImN8SODKHdVbEWMGtcEKDj9KRsNlG+EECxcShZaMuNCrYuubCS85TO0UGGh7eYdSX1irlmTs5oSG3zwNVbh3EgRRTiHINbfMc7AeUYUVddQoE2OOPY7Q64d/JQEwZ1WbkK1uUNcUDzAbJgOFP8vw+Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761236430; c=relaxed/simple;
	bh=yOi+74DlAucQ67rYxkhrnivv9TgE3jPtCAHYQQCYC8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NbBRtYEMLb4pU9iJfaK0qxTdbkJzyS0EX5XtJDtDRu3NSKmP3fXmcIJIiZsm18AreldUaZ/93Ur43CIiwCiihqsbWdgJ8GKYXq6XQzS5YJh1MIbMae75GzSJb1gRZBr93sveZ5aZfF2FZ2vwHipDpqa58C9qcgWJMVqoqqhOZ7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DwXAmqbu; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DwXAmqbu"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b5579235200so724418a12.3
        for <imx@lists.linux.dev>; Thu, 23 Oct 2025 09:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761236428; x=1761841228; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0HghvxS1xRodxk3iuqAce0Tjg7zGIVOVO9oCwG/XgrI=;
        b=DwXAmqbuV+118Kqb8KsPNCykL1iRwY6ccQRwcfZbLUmMFh2DUeRaZf02+1G8NO/BJB
         38/9fgcnBne0NUzfpCBUmOuG4S+cQsaadH0v8cPgvFLDDQUGGg7rNTwx6XvAFtUd6Ph0
         20A96HooVUUHGDrq2jlNQ2Fy/XKoWSRywKAKtSbBw2Iup88M7KOva39C4FnWoiyfl3/+
         hrJcs8O7H7lFU8/e2wBm+s8t4JHqhGXaxJgeN0DeOANM9Txn7ucg70DZr0qRKnVdpUFU
         jZc8+3cpDo3rg4rv6efsqMiTpzkKsajhQkDgAYpnCW4z7QIA1gxHldsQ4DqLAx6SSmsf
         L8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761236428; x=1761841228;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0HghvxS1xRodxk3iuqAce0Tjg7zGIVOVO9oCwG/XgrI=;
        b=vFRGseP3ia6b16A9nnSOw+qEjNbixyNyxs2xga1DHctDOYFBaXp6NHvxbum0IR3KX/
         rEA6BLD+Yvn50/1lh5DDKo8tKGtJyAOVrF6jVNTRhjdcyKFlInpxhzGt6cJhdIWbGjzo
         X/aCWTVFNaDFIxgRyeMHwvLwN1kqni+DigQYzXoD4j2iU+FopvjDBdHCCEMJMKd1aWu4
         CkEGnqDEawRf4DkL/GdOiUAlTq1x7ya4fbODVNc7bFDQ+oJkxcCElcWK0oG46+6FG4Hk
         e5idW1oDDoktMnMcw4mZlNTNrCQGxC6LmR7JobP9N8Pmr/yEayZKGZPWTXORwWvqQgOJ
         f9bw==
X-Forwarded-Encrypted: i=1; AJvYcCXccjgE03S7vvB3rNx7+CKPvJRCiE6fXCEbbaE0vn1KcpXfgqCfuDg/1Z3P/3shCtp+h80=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6vtl9qLAKtnCuuR78wb77X+2KGAq7bb9D+x9V72tnGbmtKwiQ
	pdDO4FrpkBL4127nKvOcvO+7DlzcNl5fClZaw+ciYgkFSDUaVJtK6cYu
X-Gm-Gg: ASbGnctwntyN0AA1OIjdw0wyiS3wE/OY3tDL8L0CfuvNosdDYQ9HCiI8n0VYF1nVLOh
	dso7HIdDuEYU0RdOeBnHV4h08zXmIiDodZnRet1F9ibG30cmiPENRBfCQAVZacctloerNuVuUfH
	yVbXOS2HFcqxVy6AO5EM8MOrwp4iALR5/ksg+M9YSMbE5UZL3EeRvsuZxkzZhAwecJNXJeQUn+R
	42u+S05KHGADkOHN0KmAhQg2XfOiDb4FMTI0Tfiin3BOQ1BXtrUD7NmoyuVDfVl2UXFtQL/Ca1z
	Uraf9yvuyIGgiVmIrSENNF/MoLZWMIKREJobaoivZceCPUPBTybGemrEeZVnzNHtlQwyAJRQ5Vl
	PuULsz7PdpuzmFRy8zcDndblbq1uaAnJjC8zny/g+f9ZtP1HFM8QRkjBdrZ9I0/WTuKjIruNpmq
	GaiuePW9kD81o=
X-Google-Smtp-Source: AGHT+IHlUzfF7dHw4WGoKEoZ4jVJxoqhGoMs+gcob4/KvqVdTBlT8jxUGxfuE0lfhSJNSazy1WfT1A==
X-Received: by 2002:a17:903:1112:b0:269:7c21:f3f8 with SMTP id d9443c01a7336-2946e117f30mr44006555ad.39.1761236428006;
        Thu, 23 Oct 2025 09:20:28 -0700 (PDT)
Received: from joaog-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946ddecb0esm28047245ad.35.2025.10.23.09.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 09:20:27 -0700 (PDT)
Date: Thu, 23 Oct 2025 13:20:22 -0300
From: 
	=?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	=?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>
Subject: Re: [PATCH v1] arm64: defconfig: Enable i.MX95 configs for booting
 and Ethernet
Message-ID: <bicmfrrmkdmqqtfmdmsctpkmt3kxcxrxrgdv2a4cma42om2xb7@5kkybhdapn27>
References: <20251023-upstream-imx95-smarc-defconfig-v1-1-62c6e6f5b315@toradex.com>
 <cacc9439-2cf0-42bd-b6c5-13d1e75642d8@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cacc9439-2cf0-42bd-b6c5-13d1e75642d8@linaro.org>

Hi Krzysztof, 

On Thu, Oct 23, 2025 at 02:22:40PM +0200, Krzysztof Kozlowski wrote:
> On 23/10/2025 14:19, João Paulo Gonçalves wrote:
> > From: João Paulo Gonçalves <joao.goncalves@toradex.com>
> > 
> > Enable the necessary missing configs for the i.MX95 to boot and also
> > have Ethernet working:
> > 
> > * CONFIG_NXP_ENETC4 for the network controller driver
> > * CONFIG_NXP_NETC_BLK_CTRL for the NETC hardware domain controller
> 
> 
> These do not carry any IMX95 compatibles, so I have doubts you described
> the issue correctly. You claim that SoC needs them, not the board.
> 
> > * CONFIG_PINCTRL_IMX_SCMI for the pinctrl driver> * CONFIG_CLK_IMX95_BLK_CTL for the shared hardware domain controller
> 
> 
> BTW standard comment applies - explain which upstream boards have all these.

There are already some boards that need these configs, for example, the
NXP i.MX95 19x19 EVK. For booting, the only one needed is
CONFIG_PINCTRL_IMX_SCMI for the scmi_iomuxc pinctrl driver. Regarding
the other configs, they enable Ethernet and PCIe for now. All configs
are on imx95.dtsi.

I will prepare a v2 rephrasing the commit message.

Best Regards,
João Paulo Gonçalves

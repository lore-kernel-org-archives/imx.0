Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B80B2F5A0B
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 21:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761860373; cv=none; b=NtuZul/iDMHjNo3Kvq/ZWalKPtf6SygvrJopj0G+ZegJAwRse1MrvIx9aMDU9+6rlU9kUtn9nUEAmpriz8xHZ2lUvfceTC8DNd0TpCEDbnMB6lwP3L/ZiT4VB+wI7I9mDnU5IC4o+doqB0N7bfcT5dSqAGWdgqxBtlxEISMtnRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761860373; c=relaxed/simple;
	bh=WFlyIexI14gzzzuldNdHGJV4JITfsrwcYTRONb/7CzE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=RWKRnNXRlCDhmcEQx6Y/Jc+pwZKHHLR4FRGRfMsVxDpYfyvtna8OJlO1hAng6RQEPoaLibPq5p2TFayElInWBd1rfMY3//5qQwtZpaDREzqLeiCTiWCejYI64WH+b49s8nGRmnp57VLoN3G27GtQdw/2wumNDyZsOS7RwS4Xzn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I9LUlmEz; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I9LUlmEz"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so297002266b.0
        for <imx@lists.linux.dev>; Thu, 30 Oct 2025 14:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761860370; x=1762465170; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+Z4aBFRbBiE704Kr78L6ktIIDMs4HdMIeAn+6hqXnc=;
        b=I9LUlmEzQcVRZRT1NBMWixMME2fV7bT1mltBdPQT8P2llV0PEIZuGF+NZ4INvseANF
         Ki7oWdyf8l7mvfGCH7yT8jcBYCffP4gog0H6CLkAgvABB/dBzbI4Lj2kqyH2ptVddFko
         TzaW0WD/+iFN3ye9XRP/QrffsKt2jvVCNSUVi3s3BNIQpYrLM8sPvEV3202Qp1hcY1vp
         sMuaMpZJd68JERzxBAH89WM0w7/hUfSGgu5iNZjV3cgIoDlpSljLCtg+wGR4FfJNqKPH
         UIsmaeIKPOFrur8Ajwj9dYwBeC5Qa0uxeb7+b8WKF9uZ0ahdYZWZqghUPJKcka0kVBDQ
         h7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761860370; x=1762465170;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E+Z4aBFRbBiE704Kr78L6ktIIDMs4HdMIeAn+6hqXnc=;
        b=RfvapK6bVxhmIkh0ZppdO9N0yaNzoycHKE5OE0YFQkqoWco4jigznu0fUjTzdIjCLN
         rl/S9AAjFI/lEAvwpcPvA0pxcAqkMtGgi0nnIiM3JBytgBN5Be9j+tdHsVORVQaVQNbi
         nKonjFUhcKZHkU44lK50wRslOIc9oRggUgrGe7MZzaPHKjyozAJZ7EapGWMndHyo6mYR
         3GGCqw+6tNDuAJ/xh5v0eg3px3g65yNZG3Nvh8KhLXio/Gf2z4bazZw1OUtTB8xeIU/b
         XmN+j3dZKd8zSEwi6h6B6AB+zNz1ut0K4QZMwYenvgSAp8Sj3dIP1kaQNKDdbfxIKhur
         Iqbg==
X-Forwarded-Encrypted: i=1; AJvYcCUesF4ToCmZ5mKWSjcEUOxls9NYn/zJvmWYio8hK3Hnir/RGSb5/IEn9fqZ5i3meuuBIag=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTFwwC0wverUcuYhR6cHVhf3jcZSzQ/uApnXMXJK9qCr/4cbcl
	mLh/BVOoHDR2cW21IBstEdPf+YO9L68XQFlQlcB0/JlAflW5nldWh91k
X-Gm-Gg: ASbGncuNp4lJWEvOjI9Nkm0OS3+xLMYVs7MlIcR66Vq1gxbpYsuLwsvNMF/jNbBesCv
	z6XJE77lg7ssVpvIP3uQKMl3Mz1DIniBDpwusxUbQZQpocef3S2CjvEexHnqGQ9+864lRdlP3w8
	3HMVX3z3qrc4mcHSPuUaN4tylz3e2OPUJg6Bn3gR77XRCkgm0tQmLLCXD23gJFigA5wqgiyi/S+
	G+tEG7mfkFkRQvgPULCfFeVUBYJ9ATGkO0phc6uTHI9Q76NlnZ0KZdmaDMXQtxrOkyia1WipCJ6
	heggE3DIGjitnVyjCvuMo46cqp7eWVOlwuHZMKYHWG39GEdMMWVtfeDdimd+vCF4hdSmR2b5FXi
	A/B0L7pUu4ZtS9WJhtyvaGwf7fKGWSBcIL57HUtL03aOmIu/k6AdTTWpo0SGKkFUifiK8eIl1vn
	sEHXrw2kTF9GSNW8Y7IMIxkSXefkUxWF7LeqDKfDrRh07nlrfPXvbPxu8dbQwF1SuXCaiyCr+7L
	zsm6kgUpdLieogKdJKsYjMSWmIR/Yi+T7mgkMygXbkx/ML6MmxkVA==
X-Google-Smtp-Source: AGHT+IH33A3IZf5JH3qGVGFsjIEcTWzgSwfEhDPkDUgrYDxBSHDFAWfg2IEswXtHcRF99P2jtkDStQ==
X-Received: by 2002:a17:907:7286:b0:b3c:a161:684c with SMTP id a640c23a62f3a-b70701055e6mr122986666b.2.1761860369354;
        Thu, 30 Oct 2025 14:39:29 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f48:be00:f474:dcfc:be2f:4938? (p200300ea8f48be00f474dcfcbe2f4938.dip0.t-ipconnect.de. [2003:ea:8f48:be00:f474:dcfc:be2f:4938])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8534d99dsm1855428866b.21.2025.10.30.14.39.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 14:39:28 -0700 (PDT)
Message-ID: <0285fcb0-0fb5-4f6f-823c-7b6e85e28ba3@gmail.com>
Date: Thu, 30 Oct 2025 22:39:34 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next 0/6] net: phy: remove fixed_phy_add and first its
 users
To: Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Hauke Mehrtens
 <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Chan <michael.chan@broadcom.com>, Wei Fang <wei.fang@nxp.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

fixed_phy_add() has a number of problems/disadvantages:
- It uses phy address 0 w/o checking whether a fixed phy with this
  address exists already.
- A subsequent call to fixed_phy_register() would also use phy address 0,
  because fixed_phy_add() doesn't mark it as used.
- fixed_phy_add() is used from platform code, therefore requires that
  fixed phy code is built-in.

fixed_phy_add() has only two users
- coldfire/5272, using fec
- bcm47xx, using b44

So migrate fec and b44 to use fixed_phy_register_100fd(), afterwards
remove usage of fixed_phy_add() from the two platforms, and eventually
remove fixed_phy_add().

When I proposed helper fixed_phy_register_100fd() first, there was
the question whether it's worth it, and Jakub asked to submit the
full series:
https://lore.kernel.org/netdev/20251021182021.15223c1e@kernel.org/
Apart from this series, there are two more places where the helper
can be used to simplify the code: dsa_loop, ftgmac100
I left this for a follow-up.

Heiner Kallweit (6):
  net: phy: fixed_phy: add helper fixed_phy_register_100fd
  net: fec: register a fixed phy using fixed_phy_register_100fd if
    needed
  m68k: coldfire: remove creating a fixed phy
  net: b44: register a fixed phy using fixed_phy_register_100fd if
    needed
  MIPS: BCM47XX: remove creating a fixed phy
  net: phy: fixed_phy: remove fixed_phy_add

 arch/m68k/coldfire/m5272.c                | 15 -------
 arch/mips/bcm47xx/setup.c                 |  7 ---
 drivers/net/ethernet/broadcom/Kconfig     |  1 +
 drivers/net/ethernet/broadcom/b44.c       | 37 ++++++++--------
 drivers/net/ethernet/freescale/Kconfig    |  1 +
 drivers/net/ethernet/freescale/fec_main.c | 52 +++++++++++------------
 drivers/net/phy/fixed_phy.c               | 18 +++++---
 include/linux/phy_fixed.h                 |  8 +++-
 8 files changed, 66 insertions(+), 73 deletions(-)

-- 
2.51.1


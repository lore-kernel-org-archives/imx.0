Received: from mail-ej2-f10.google.com (mail-ej2-f10.google.com [74.125.228.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FD137E5E9
	for <imx@lists.linux.dev>; Sat, 19 Sep 2026 16:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789835511; cv=pass; b=dKegtcq3GKf9MYxnf0yuY02MnvjaPx/LA451ibuUNgDqohwlsMPlG7Amq15dzPS36srrCDEN9NVy0vSgm2pw0Qu3klIQ+AeaVvk5Ua2gsBR96nw+i51t3x/uUCz4R9+mnU/sxccFPNJgNMusmLo6tJnW6pf/yRUiy21drHq6Sow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789835511; c=relaxed/simple;
	bh=FoBb+MCNrssOL4O5BLzYqYW9vzpXkaseLuESacaKWDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cf8x0WF1hLBIbolf8lqxpVZZfA1id31mRpOEzqHFNQMy2xZMuPai4JhvClGHnYl0yYbBD0zA5Fq3xHd6gzh2/j4yZ0lhpyd2o7biqDe8VG3FRTMSnXNhR2JhHwREDRQH5CxSXeFdfhL8/x2bbfnuUbkwKDBEXAmeTdHEdjE7x0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFT/5NV5; arc=pass smtp.client-ip=74.125.228.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFT/5NV5"
Received: by mail-ej2-f10.google.com with SMTP id a640c23a62f3a-c2142244006so19964366b.1
        for <imx@lists.linux.dev>; Sat, 19 Sep 2026 09:31:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789835507; cv=none;
        d=google.com; s=arc-20260327;
        b=AFDncYW+kjShq+0Qn5pqEm7pJaq8EmNzyUqq+42w6KvFdJiNUK7iEh9wVOZJ8kW3VO
         SoaxRFSYVFfKQRkLREFEVQMuBLI2I/O7K46IA2IF0VnVdal+5WQkkuWEEJIlle9PdNJF
         iKVF0xM4J14FIM/A7iAbCMzc81Lp5MFGUUEZ8IyZ7xfCS8vVBXyRbA2WUtG1s7ZdRxKF
         Jxb07Ue9FCJ7ffr3+yHkfloXw5z/g7cvcgNEk2fCj3jxqRWm6GdsE1OVL7Z/KSOw8ZYQ
         HPZxwFGaEtN6twrNd2qqMgc6o9a+sYRDigBlLq6fekNXVy4nieDgbiDsDb0SpDSAIIBg
         7Hog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FoBb+MCNrssOL4O5BLzYqYW9vzpXkaseLuESacaKWDE=;
        fh=VbnecjcaIxI00ieAYUkh0jHz2ny2Vtg9jcTK9m+4CBs=;
        b=MNmFtj4NLotg6rnNc1mc1/6DadRNgE0XdjKBEiLwsSQDlt+HmCu9zHhBVuwa8X0/HE
         7UsyAdLQ6ZaDdXvisnzISVzVFyl6keF4H9v9jofXLKzifEG4IyK8Gax3k+riP/PII5OH
         Cj41SYlZRtX8oHd/m5kNNeI87KKg42jdbR4FM9nzTu2BMumi3sweno42PJHHA7Da845c
         eaW9kfaQ7j2gVsZox7uGWGzk03HR45FFp2yqwJtcS2Pxg1BD8Ho88enFpTnR9KgRahXm
         EUZdwCK8Unf8SkxHfsl8IBotYg5SIbCKQvPnft+QKEC/A6NFZUTZQrHwD1NQodxac6yS
         2RLw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789835507; x=1790440307; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FoBb+MCNrssOL4O5BLzYqYW9vzpXkaseLuESacaKWDE=;
        b=kFT/5NV5cs0ysNDjZcZ/xrsx3Zi9uIGdyBNUY4VxW2UNbdF5cpAGjyE1BX/n0T/Alg
         PztBPNpBDlGw7DlbFx1/RrLsr830X4VRZLfZBXxDneJ46qcx6atfmHZg+9okf5anv/yf
         YuGakOvhrL9Wrhlq30mMw7bTUbXi1Te9t/P9XnDibb3hxDNt+4uM+H9aCggg78fX+u8P
         2oXDuIL288Fgjy1pyWt9TfI/YpB69OhY38FutztJGVsB8Le198MBR5a1eYu7JRe9GdmM
         oymbccqftpT5VrIPoSn9c+XzZzvsVR8xl/6+cGxCbEhk2RDufLV7RsBbIReQGi1qstA/
         T5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789835507; x=1790440307;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FoBb+MCNrssOL4O5BLzYqYW9vzpXkaseLuESacaKWDE=;
        b=IoPD6+F4ED2ldORC/nlU4DS4kkvU67URimD1Ljy5x4/TjiXuJvVHSgj1jeBnjWQJga
         elw9deJNOgEfNR9pP/3PGDdkeHxjxn4K+aCIXnhnK4kn3/JXdLHnKBNqlHhnwTo9GMht
         7fIyElq2vAFWgUQWpDX6E2fK6VTMdX+7b2U69KqmIyH0Ozmhh5rPtdUZ1nbypoH2M04f
         +sVqyLwiN6kkrSn7mO6Ik55+gGEjAvxmY86E0VaCKCKmfKtcflpeK9+CGHCYiY4jA7NY
         iv32BgJatLv5ndHUqcIgWoTF0id7p9VlPEpGyiqDyweYRY/zErIsTaX11C7sVDKzk16n
         1GnA==
X-Forwarded-Encrypted: i=1; AKwUvBw6eue3kr7e3RPfe/FQ9ABktGth5dNguQihbXT4JJnje4ymMigv7IOAE/LdcvO8llkSxLM=@lists.linux.dev
X-Gm-Message-State: AFuF++mVKluCHVZ2mFsMYX4l8hgpWvieBOb4eH5XMYmundw/2ilJiQmX
	mLilgrUNC1btVe0swrr0YK74EcYqamHq7Om80KcB+oZzTX2qU7VzEqNx3BhBxw+1xPhynsxshNv
	2Y7cb+S9EEWz96wH1Ly6bGAJKYzh3pp4=
X-Gm-Gg: AYBFou2d0phOop4Eh4zQIMatrjd9Zj0f8bT1geiMSkXjbBaOrFrOkWUW9eMr9cYSysC
	dY7XbZvGpmAjLMRx7vJ6iqJjhK+P6oHTS5ynOGJeCxlyQsXVf0223yssI0a5x+SkzPLYiXWJtJF
	+fFObO7m2qxm+L2blBa9/sngWUTKWwaYvGx0KRq9fVbI91Gf3bfX1bbsoQZwkGv1h5rXdFljKPu
	g6DexkLI3G+pPpww4TPa2wLnrFQuIdDXdgYGUzBgzublas7LFHtVlXNZY9E+IgbyfcUMgkdtBWT
	41nDO6ON1yEtgmOaj01+0oVhSkLlGGdaVqJPvCIpviGoHRO3jQy9mLZzXw==
X-Received: by 2002:a17:906:2099:b0:c29:c575:de84 with SMTP id
 a640c23a62f3a-c2a164422b2mr337838566b.8.1789835507327; Sat, 19 Sep 2026
 09:31:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260919-s32g_serdes-v3-0-9d68868c1e89@oss.nxp.com>
 <20260919-s32g_serdes-v3-4-9d68868c1e89@oss.nxp.com> <6aabb56e-406f-4d13-9fd8-54822202039f@bootlin.com>
In-Reply-To: <6aabb56e-406f-4d13-9fd8-54822202039f@bootlin.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Sun, 20 Sep 2026 00:31:35 +0800
X-Gm-Features: AcwNN1VbQyHS1-cJU3SdJ4oOQkYk_cjiBlklhRFTetXHOgzYOSwzbp6stXuvGvc
Message-ID: <CALj3r0g2FtxRRUDnG80SZJGSbpyBekTkd0R1ek-z-1h-d830ig@mail.gmail.com>
Subject: Re: [PATCH RFC v3 04/12] net: pcs: add NXP SerDes XPCS shared core
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: jan.petrous@oss.nxp.com, 
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>, NXP S32 Linux Team <s32@nxp.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Bogdan Hamciuc <bogdan.hamciuc@nxp.com>, 
	Ionut Vicovan <ionut.vicovan@nxp.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Clark Wang <xiaoning.wang@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	imx@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Maxime Chevallier <maxime.chevallier@bootlin.com> =E4=BA=8E2026=E5=B9=B49=
=E6=9C=8819=E6=97=A5=E5=91=A8=E5=85=AD 23:31=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Jan,
>
> On 9/19/26 08:54, Jan Petrous via B4 Relay wrote:
> > From: Clark Wang <xiaoning.wang@nxp.com>
> >
> > The SerDes subsystems found on NXP S32G and i.MX SoCs integrate a
> > Synopsys DesignWare Ethernet XPCS and an Ethernet PHY (PMA) with an
> > identical register layout. Only the register transport differs: indirec=
t
> > memory mapped access on S32G, Clause 45 MDIO on i.MX.
> >
> > Add a transport agnostic phylink PCS core which operates on regmaps
> > provided by the platform glue. It implements the phylink PCS operations=
,
> > the Clause 37 SGMII / 2500BASE-X / USXGMII / 10GBASE-R configuration an=
d
> > link state handling, soft reset and polling helpers, and the common
> > feature sets. The platform specific register sequences, compatibility
> > tables and quirks are supplied through a per revision descriptor by the
> > platform drivers selecting this core.
> >
> > The register sequences and the feature lists are derived from the
> > Synopsys pcs-xpcs driver, so its copyright is retained. A separate driv=
er
> > is needed because struct dw_xpcs is built around an mdio_device and own=
s
> > the transport, the reset and the identification of a standalone PCS,
> > while here the PMA can be shared with a PCIe controller, the bring-up i=
s
> > sequenced across both XPCS instances by the SerDes PHY driver, and the
> > transport is not always MDIO.
>
> Is there a way to avoid code duplication by wrapping the accesses into
> a mii_bus ?
>
> This is what the Rockchip submission does :
>
> https://lore.kernel.org/r/20260919125119.2107089-8-coiaprant@gmail.com
>
> Maxime

Hi Maxime,

The Rockchip approach (wrapping MMIO into a virtual mii_bus and reusing
pcs-xpcs.c) is indeed relevant here. Alex Elder's pcs-xpcs-regmap does
exactly that for the TC956x: it registers the XPCS through a regmap and
creates the virtual MDIO bus internally, with both direct and indirect
(page viewport) access modes.

https://lore.kernel.org/all/20260605010022.968612-4-elder@riscstar.com/

The indirect mode is very close to what S32G needs. For i.MX the C45
MDIO transport is different, but the bus wrapper could still be shared.

That said, I think there is a broader gap in pcs-xpcs.c: it hardcodes
behaviors that vary between integrations. RK3568 cannot use out-of-band
SGMII (fixed 125 MHz MAC clock), so its in-band caps should be
LINK_INBAND_ENABLE only. Today that means editing xpcs_inband_caps() or
duplicating it. NXP is hitting the same kind of problem with soft reset,
poll and EEE quirks.

A callback in dw_xpcs would let platform glues express those differences wi=
thout
copying the register sequences. That's the same pattern stmmac uses with
plat->pcs_init/pcs_exit.

Once that callback mechanism lands, I'll send a separate patch to wire
it up in pcs-xpcs-rk.c. Since the Rockchip driver is not even merged
yet, there is nothing to change there for now.

Coia

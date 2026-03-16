Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BBE3DD507
	for <imx@lists.linux.dev>; Mon, 16 Mar 2026 18:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773685884; cv=none; b=q3NQLsG8gcQCyxaKKjt8GN/jOabMaXT1GoOqfMWejzXYEHPr8y+eyPuld6ZSX8Xny1Rp3fL+XCif6dGiztDXkpQl71+jmBov9MahhTBqIbnYcKgAMZip+B8VyymSskxHEA5ffmzmXZXoYmvIXo67swOU9rblGWcVWTHei/UHRFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773685884; c=relaxed/simple;
	bh=0ZYtisBfFCEDlffU86ZXcFsWQWlCFQ0yAs36eyfQuEk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fWdejtpEhD8G+ymLXnReBNTm/VfYhr9DaczULtODooegWBaniDJU3KgTxeIOBR0Stq+CcvifvHPaB0kY9WWlwlQXTHP5VFWJPz019PTuaykWqrbBmxXqyrz9Q0P1IPFjhCngJEWwoHnGI8DmNjdSEo8zTns/KgOpJRbfyEUwgKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GCF00AJC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GCF00AJC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773685876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BNBEVCAdHGNat6EhquVBIDr5xmo+EfnKaRHucm6TIJk=;
	b=GCF00AJCWBZj0OUPqiPEMdeL890VLT/mPqSGORudiJBEWiaXmCBogpjb0wPc64OjiAwluP
	pESnVfD8TrRfO1eyRnVBbk02ol7/aUJMHiE9t1EKwbf6QtufW39nI9qHonUkX+CwzPFcti
	xfa0EQrtfde6c29fny7fZfgI1NwaLiw=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-ph7dZm1SPEWc5lL-rt3_2w-1; Mon, 16 Mar 2026 14:31:14 -0400
X-MC-Unique: ph7dZm1SPEWc5lL-rt3_2w-1
X-Mimecast-MFC-AGG-ID: ph7dZm1SPEWc5lL-rt3_2w_1773685874
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50921f7da6dso53286801cf.0
        for <imx@lists.linux.dev>; Mon, 16 Mar 2026 11:31:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773685874; x=1774290674;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BNBEVCAdHGNat6EhquVBIDr5xmo+EfnKaRHucm6TIJk=;
        b=W1ImUvsiD5dos7vX/p8Eb3bMV8ifLV5NqWuCPuKqqVKZdmmfBG/6NEOGnHJRfJ7Ova
         W00rFhfpjmY5QMwJxXhrze2uCJhCZ5/JvPf5mSmAZKplDkDQY37nXaiV4KmyfBSAmuw7
         9m5rHzdfw+NiKh6BxpKWImhVnwUQv2dNjBEYEHK9SYpjfyoIXl0lmtQkRHOx2rBC4zqT
         hpHUwlyzQR7KxwXnG9zFeYG3Y6JFwrDgl9uVGsJt8nP6u7fGmGjNSNqACJ1xdHpYaA7o
         sJl37IePUUu9wxIyZyh9Ym7Goxx8RqAL3REUQo8eB16pfXrpgGt6EBvQKdw59s2Gy/k/
         x73g==
X-Forwarded-Encrypted: i=1; AJvYcCUhiTTyRRJSOkT+ZtQgU8WQ+JzFvKw4sPtbUqgqTNYDTs2HdC2lbxJ5qhSNKzAmiMu8WDo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUgNj3ICusaWipeKdGvpU1lvFHo1ax1q6mu+yevxyQe1nKYj0O
	SYt1qBYWBEdNX8Mq2BdvhuIfWveh55kLh+DQ/cK5CXbexmB+J9FSsplx6wxxWBDVNi3XY7QIQQm
	s+kWwVwyGXhh0RP9ORkti2zFHBPB7wZFLKCxxcpLIo10rIFsMQHq70g==
X-Gm-Gg: ATEYQzwngT9lf5D5+ThdmQo0RaxEdu/N7FTw52yCkNOf78ngHIf26H2/iBB/eV+whAh
	tGXo0HWKuBRMR9tUFIginZr8sdciivmPzOf3F6pbotmbOGDc1sWWS9Ii+wPAxLNA0nO91g3s1BQ
	wRaf8m86IyAUDkM1q6JU6CgRU0erUzgpc+cbMosaz4ExFkCXSRdIKNBpBoqJ5c2Vb5RVk0ksLlD
	FpHR2K/zbU5iF29glQ6OLLwxdEujms9/0KAEAiL9ARpyAovSvgw4EmwE2SHlpkhBYH8wUK0V24o
	EjfPdD3hCQyCAJ7xZFnTAdGePxwykpKLEWkILYlAregn2ZqS1SpNt3NEdghuBL2IIsRrFyERl40
	L4uQJBVDJ4Zuieac7Um/bBFuPtIPbfN6lglfnyyZ3wBAN4sPxpci2a9ryNUFVIp7dFim+qcbl08
	Oq7nImfA6HT7O0/A==
X-Received: by 2002:a05:622a:15d3:b0:509:17e4:ceed with SMTP id d75a77b69052e-50957cb5a7amr187472901cf.9.1773685873531;
        Mon, 16 Mar 2026 11:31:13 -0700 (PDT)
X-Received: by 2002:a05:622a:15d3:b0:509:17e4:ceed with SMTP id d75a77b69052e-50957cb5a7amr187471881cf.9.1773685872774;
        Mon, 16 Mar 2026 11:31:12 -0700 (PDT)
Received: from thinkpad-p1.localdomain (pool-174-112-193-187.cpe.net.cable.rogers.com. [174.112.193.187])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5093a0ea244sm124136001cf.16.2026.03.16.11.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 11:31:12 -0700 (PDT)
Message-ID: <64d282fd94be1546df75d7df5b47eacc0479797a.camel@redhat.com>
Subject: Re: [PATCH net-next v9 0/6] net: stmmac: qcom-ethqos: add support
 for SCMI power domains
From: Radu Rendec <rrendec@redhat.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Bjorn
 Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn	 <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet	
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni	
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Vinod Koul <vkoul@kernel.org>,
 Giuseppe Cavallaro	 <peppe.cavallaro@st.com>, Chen-Yu Tsai
 <wens@kernel.org>, Jernej Skrabec	 <jernej.skrabec@gmail.com>, Neil
 Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo
 <shawnguo@kernel.org>,  Fabio Estevam <festevam@gmail.com>, Jan Petrous
 <jan.petrous@oss.nxp.com>, s32@nxp.com, Mohd Ayaan Anwar	
 <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>,
  Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,  Christophe
 Roullier <christophe.roullier@foss.st.com>, Bartosz Golaszewski
 <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,  Drew Fustini
 <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
 linux-amlogic@lists.infradead.org, 	linux-mips@vger.kernel.org,
 imx@lists.linux.dev, 	linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, Bartosz Golaszewski	
 <bartosz.golaszewski@linaro.org>, Martin Blumenstingl	
 <martin.blumenstingl@googlemail.com>, Krzysztof Kozlowski	
 <krzysztof.kozlowski@oss.qualcomm.com>, Lad Prabhakar	
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Konrad Dybcio	
 <konrad.dybcio@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 14:31:08 -0400
In-Reply-To: <20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com>
References: <20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com>
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dvjClu3szuT6TShDc4JpYqQsgK1DnVRwD5OXCQm1lw0_1773685874
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-03-16 at 13:05 +0100, Bartosz Golaszewski wrote:
> Add support for the firmware-managed variant of the DesignWare MAC on
> the sa8255p platform. This series contains new DT bindings and driver
> changes required to support the MAC in the STMMAC driver.
>=20
> It also reorganizes the ethqos code quite a bit to make the introduction
> of power domains into the driver a bit easier on the eye.
>=20
> The DTS changes will go in separately.

I'm seeing some weird behavior with this version. The probe part looks
good (but see below), but when I try to bring an interface up, it fails
with ETIMEDOUT. The relevant part of the stack trace leading to the
error is this:

dwmac4_dma_reset+0x208/0x220 [stmmac]
stmmac_reset+0x2c/0x68 [stmmac]
stmmac_init_dma_engine+0x108/0x400 [stmmac]
stmmac_hw_setup+0x5c/0x538 [stmmac]
__stmmac_open+0xc8/0x2a0 [stmmac]
stmmac_open+0xcc/0x238 [stmmac]
__dev_open+0x138/0x2a8

Now dwmac4_dma_reset() is very simple. It sets the soft reset bit in
the DMA_BUS_MODE register, then waits for the hardware to clear it, and
that never happens.

Now, getting back to the probe part, there is one extra message
(compared to my previous successful test on v7), which I see at the
very end of the probing:

  qcom-ethqos 23040000.ethernet: clk_csr value out of range (0xffffff00
  exceeds mask 0x00000f00), truncating

This is a sa8775p ride board, so there are two stmmac devices. I only
see that message for the 2nd one, which is also the one I'm trying to
enable, and which fails.

I realize this may or may not be related to your changes. But there is
no way to test on a SCMI-pd board without them. I'm not sure how
relevant it would be to test on the non-SCMI variant. I'm assuming the
DMA part should work the same way (regardless of SCMI-pd), so if I can
reproduce it there, and since I know it works on mainline Linux (that's
where I tested v7), I could bisect and see which commit in net-next
breaks it. If you don't have any better idea, let me know and I can
try. Meanwhile, I'll keep poking at v9.

Radu

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Changes in v9:
> - Rebase on top of current linux-next again
> - Link to v8: https://patch.msgid.link/20260311-qcom-sa8255p-emac-v8-0-58=
227bcf1018@oss.qualcomm.com
>=20
> Changes in v8:
> - Rebase on top of recent changes in linux-next which required an
> =C2=A0 extensive rework
> - Drop partial R-b tags
> - Link to v7: https://patch.msgid.link/20260306-qcom-sa8255p-emac-v7-0-d6=
a3013094b7@oss.qualcomm.com
>=20
> Changes in v7:
> - Restored the correct authorship after learning git uses .mailmap for
> =C2=A0 the --author switch
> - Rebased on top of changes from Russell
> - Fixed resource management issues in error paths
> - Link to v6: https://lore.kernel.org/r/20260112-qcom-sa8255p-emac-v6-0-8=
6a3d4b2ad83@oss.qualcomm.com
>=20
> Changes in v6:
> - Fix $id value in the bindings
> - Drop patch 3/8 from the series
> - Update init/exit callback signatures
> - Link to v5: https://lore.kernel.org/r/20251107-qcom-sa8255p-emac-v5-0-0=
1d3e3aaf388@linaro.org
> - Link to v6: https://lore.kernel.org/r/20251219-qcom-sa8255p-emac-v6-0-4=
87f1082461e@oss.qualcomm.com
>=20
> Changes in v5:
> - Name the DT binding document after the new compatbile
> - Add missing space
> - Make the power-domains limits stricter
> - Link to v4: https://lore.kernel.org/r/20251104-qcom-sa8255p-emac-v4-0-f=
76660087cea@linaro.org
>=20
> Changes in v4:
> - Remove the phys property from the SCMI bindings
> - Mark the power-domain-names property as required
> - Set maxItems for power-domains to 1 for all existing bindings to
> =C2=A0 maintain the current requirements after modifying the value in the
> =C2=A0 top-level document
> - Link to v3: https://lore.kernel.org/r/20251027-qcom-sa8255p-emac-v3-0-7=
5767b9230ab@linaro.org
>=20
> Changes in v3:
> - Drop 'power' and 'perf' prefixes from power domain names
> - Rebase on top of Russell's changes to dwmac
> - Rebase on top of even more changes from Russell that are not yet
> =C2=A0 in next (E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk)
> - Link to v2: https://lore.kernel.org/all/20251008-qcom-sa8255p-emac-v2-0=
-92bc29309fce@linaro.org/
>=20
> Changes in v2:
> - Fix the power-domains property in DT bindings
> - Rework the DT bindings example
> - Drop the DTS patch, it will go upstream separately
> - Link to v1: https://lore.kernel.org/r/20250910-qcom-sa8255p-emac-v1-0-3=
2a79cf1e668@linaro.org
>=20
> ---
> Bartosz Golaszewski (6):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dt-bindings: net: qcom: document the ethqo=
s device for SCMI-based systems
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 net: stmmac: qcom-ethqos: use generic devi=
ce properties
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 net: stmmac: qcom-ethqos: wrap emac driver=
 data in additional structure
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 net: stmmac: qcom-ethqos: split power mana=
gement fields into a separate structure
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 net: stmmac: qcom-ethqos: split power mana=
gement context into a separate struct
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 net: stmmac: qcom-ethqos: add support for =
sa8255p
>=20
> =C2=A0.../bindings/net/allwinner,sun7i-a20-gmac.yaml=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 3 +
> =C2=A0.../bindings/net/altr,socfpga-stmmac.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +
> =C2=A0.../bindings/net/amlogic,meson-dwmac.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +
> =C2=A0.../devicetree/bindings/net/eswin,eic7700-eth.yaml |=C2=A0=C2=A0 3 =
+
> =C2=A0.../devicetree/bindings/net/intel,dwmac-plat.yaml=C2=A0 |=C2=A0=C2=
=A0 3 +
> =C2=A0.../bindings/net/loongson,ls1b-gmac.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +
> =C2=A0.../bindings/net/loongson,ls1c-emac.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +
> =C2=A0.../devicetree/bindings/net/nxp,dwmac-imx.yaml=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 3 +
> =C2=A0.../devicetree/bindings/net/nxp,lpc1850-dwmac.yaml |=C2=A0=C2=A0 3 =
+
> =C2=A0.../devicetree/bindings/net/nxp,s32-dwmac.yaml=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 3 +
> =C2=A0.../devicetree/bindings/net/qcom,ethqos.yaml=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +
> =C2=A0.../bindings/net/qcom,sa8255p-ethqos.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 98 +++++
> =C2=A0.../devicetree/bindings/net/renesas,rzn1-gmac.yaml |=C2=A0=C2=A0 3 =
+
> =C2=A0.../bindings/net/renesas,rzv2h-gbeth.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +
> =C2=A0.../devicetree/bindings/net/rockchip-dwmac.yaml=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 3 +
> =C2=A0.../devicetree/bindings/net/snps,dwmac.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +-
> =C2=A0.../bindings/net/sophgo,cv1800b-dwmac.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +
> =C2=A0.../bindings/net/sophgo,sg2044-dwmac.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +
> =C2=A0.../bindings/net/starfive,jh7110-dwmac.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +
> =C2=A0.../devicetree/bindings/net/stm32-dwmac.yaml=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +
> =C2=A0.../devicetree/bindings/net/tesla,fsd-ethqos.yaml=C2=A0 |=C2=A0=C2=
=A0 3 +
> =C2=A0.../devicetree/bindings/net/thead,th1520-gmac.yaml |=C2=A0=C2=A0 3 =
+
> =C2=A0.../bindings/net/toshiba,visconti-dwmac.yaml=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0drivers/net/ethernet/stmicro/stmmac/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0.../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c=C2=A0=C2=A0=C2=A0 |=
 401 +++++++++++++++++----
> =C2=A026 files changed, 498 insertions(+), 72 deletions(-)
> ---
> base-commit: dac1315bf558e4895665aa1c278fd30113ca119d
> change-id: 20250704-qcom-sa8255p-emac-8460235ac512
>=20
> Best regards,


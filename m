Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E84E421EF8;
	Mon, 24 Aug 2026 13:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787577138; cv=none; b=QKKTHPfyTP96QjjNLXxSPmJYZ5VWX5jidP2EViYVzyjwnb8WcoPAV9dePJpbHx97/96b1AsgG6SMsL0Q4zNQb7igx3UXy+YVVJMz8igrJCofRyKbAs4C2liltb8jCzT2C0egv3AIClU3OJkuIJ7xGSoH8ZLEzow2IGoL6H8yZJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787577138; c=relaxed/simple;
	bh=eOmEAB1Xz6tQIVGWJ9mAtX/RxTJecAHU6ZfIuBfKcTM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gIXCdoPxB7PqZSw7AwDSb3DDIDka2mKMZiea+2JdiRC8ehl2+eK3JenAIujZ4jJ76l61Pvj4hQBuBCQCOS5bG0D8+rW9JEf24H1bk3Dascwj1CQ5Nf/FEXPcH5AXnurDgu5U5BQRPthUeZoKihF72t1S4LtbmUMs9Wdg9haoE7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qhySWPr0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qhySWPr0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE0A6C2BCF6;
	Mon, 24 Aug 2026 13:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787577137;
	bh=eOmEAB1Xz6tQIVGWJ9mAtX/RxTJecAHU6ZfIuBfKcTM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=qhySWPr0VHZGqjN/KwT7QrpaUm1QaFCwBZ9KSEgivYSE32xyxR584N3A0phKeehQ2
	 ec5bRlZ/iYw9F92ZBX8GYtsxw9viV/2oJOsz8iZa9xjLIrCTx1A9cLPEQGi085+nbG
	 WFTN2ssGNBTdkQtHL5/lUV1c2PKnQ0PfQKANDJm+xjjzp/N123xD3ruMi2wnyAhCwZ
	 7yZ7sBXHfvPaAoGxSbGkcoMC64zgExPH3vsmN06X5uL4W0oeG/SPfIqzmR0h4lAKFM
	 oSNqK8IpxjJPgsXO6UneCeAB2yuEUW1p3oHFGSOm6hwm5kGCKiZ0q7tGo5E+nuqr0u
	 0xL/SxMA1pUtQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9508BC5DF9B;
	Mon, 24 Aug 2026 13:12:17 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Subject: [PATCH v2 0/3] arm64: dts: lx2160a: fix the malformed pinmux
 entries
Date: Mon, 24 Aug 2026 15:12:00 +0200
Message-Id: <20260824-for-upstream-lx2160a-pinmux-fix-v2-0-0a525d5f4cd5@free.fr>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACBDjGoC/42NSw6CMBBAr0Jm7Zi2CKmuuIdhUehUJpFPpkAwh
 LtbOYHL9xbv7RBJmCI8sh2EVo48DgnMJYO2c8OLkH1iMMqUypobhlFwmeIs5Hp8b0aXyuHEQ79
 sGHjD0qs7WdP4om0gVSahpM/Ds07ccZxH+ZzDVf/s/+1Vo8Y8d3lrfUHOuioI0TUI1MdxfAErm
 y1szAAAAA==
To: Frank Li <Frank.Li@nxp.com>, Carlos Song <carlos.song@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Josua Mayer <josua@solid-run.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thibaut Collet <thbt.cllt@gmail.com>, Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787577136; l=2864;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=eOmEAB1Xz6tQIVGWJ9mAtX/RxTJecAHU6ZfIuBfKcTM=;
 b=TpqRhxT6XpYSa4kKcljJVHo28WzdMGU8ReP/52n6CNe+J58fYSbtjUbVrv5Lx++3QhodVkeZE
 cJAqxgwss+ZDA82Dd++CCrMPfzbvO1NwfN5NsxPtxcAYNZuqTnt51DB
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
Reply-To: vjardin@free.fr

Every pinctrl-single,bits entry in the lx2160a pinmux@70010012c node was
reviewed against what pinctrl-single actually accepts in bit-per-mux mode:
 the offset has to name one of the three registers the node maps,
 the mask has to equal pinctrl-single,function-mask shifted to the field,
 the value has to fit inside that mask.

Three entries fail one of those rules, and each fails differently:

  1/3 the three gpio1 groups put the field value at bit 0 instead of at
      the field, so pcs_parse_bits_in_pinctrl_entry() masks it away and
      the mux write does nothing;

  2/3 the two iic1 groups carry a one bit mask, which the driver rejects
      outright with "Invalid submask", dropping both pinctrl states of
      i2c0 along with its bus recovery;

  3/3 iic5-spi3-pins has the field value in the offset cell, leaving an
      invalid offset and a value that selects the neighbouring sdhc1
      function rather than SPI3.

After the series no entry in that node is malformed anymore.

Only 1/3 was sent with the v1, as a single patch. The other two turned up
while checking whether it was the only one of its kind in that node.

They are 3 patches rather than 1 because each fails differently and
each requires the reviewer to check something different:
 1/3 is mask arithmetic,
 3/3 needs the IIC5_PMUX encoding table to confirm which
     function value is right,
 2/3 is a partial revert of a change that was made deliberately.

1/3 and 3/3 share a Fixes: tag and are still not folded together:
  - one is a value that is never shifted into its field,
  - the other is a value that ended up in the offset cell and also names
    the wrong function
and both they touch unrelated pads.

I can squash any of them if you would rather have them merged.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
Changes in v2:
- Rebased onto current mainline. fsl-lx2160a.dtsi was renamed to
  fsl-lx216x.dtsi by commit 285560f0d39d ("arm64: dts: lx2160a: split the
  dtsi to avoid delete-property"), which landed in the v7.3 merge window,
  so v1 no longer applied.
- Added 2/3 and 3/3: two more malformed entries in the same pinmux node,
  found by auditing the rest of it.
- Link to v1: https://lore.kernel.org/r/20260824-for-upstream-lx2160a-pinmux-fix-v1-1-33a3c8d5ea8a@free.fr

---
Vincent Jardin (3):
      arm64: dts: lx2160a: fix incorrect pinmux
      arm64: dts: lx2160a: fix IIC1 pinmux submask rejected by pinctrl-single
      arm64: dts: lx2160a: fix the iic5 spi3 pinmux offset and value

 arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
---
base-commit: 0a0d1d55dad570724bf8c7ea83409639cfb4be9b
change-id: 20260824-for-upstream-lx2160a-pinmux-fix-6d09e82bd5cb

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>



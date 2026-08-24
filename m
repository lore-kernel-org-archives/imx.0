Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29D93911CE;
	Mon, 24 Aug 2026 21:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787606749; cv=none; b=S4MrXOgbt5K/1zeH4wUKV8P9KTeNOsiX+9DNLcFNvYEEuHRK2cvM31uL/mHYlBVBWS2VyTNSoTAjzoS5130cAykOd8AViZT+mEnnVC7Oi6Znt1HaTzBVP1icQcNlDxCn5E7QVpbOn6UhM8VdfyeOebvJBfW9/o6K0P1PlwIbq30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787606749; c=relaxed/simple;
	bh=DMzETM3+OkJKc6qgpdSW8xVmC4w5CNfGRBEct9Ookao=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jeiTLespsj8emW+CdNmXizjTmHA00TtZOcago3EBPigfmfqiDshdOiI8910io6/T020M8w9QGRvTbj6JUV6mGAbhG4N+GAg+m9j0fmyNMdlzDTeBCQ4Yh0DM7sgb4aYc7FtUpMCDeb0fr9JUb8BmMaAsoy8F/ZcIqI4LIwNl6+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sxu13gcJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sxu13gcJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 718A5C19425;
	Mon, 24 Aug 2026 21:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787606749;
	bh=DMzETM3+OkJKc6qgpdSW8xVmC4w5CNfGRBEct9Ookao=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=sxu13gcJGp2BeXOhVerY+0b6fdid8sgEnP+edLQBo3w2jeULpHqPrLGlqyTJUrSWK
	 oi9e5wLprjE4k5cqRRfMS6NpC+t2zjNrd+c48EqrLLOCQEswmiAYGJ1RGHH6WgDSii
	 hMjaqCi/gRznxdd1NrzQaH+pV5zvhixXQOm4vto8AubL1gWKXgHzzT5EOsgPSkvuC6
	 86kxtI6ghwNMvT+xID8HtmO/YBVcKAw1rp3DNvQGBmWaIjvHfxqza3PCOKtJY8qahx
	 e9PcNTm2c5aHkMQe1nqKa5lswEsoG4d/7n6NNPNCaIb0DKc16xN24LRjGF9/L1ZLSI
	 HZS4ZufbWK7MA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C1C0C5DF94;
	Mon, 24 Aug 2026 21:25:49 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Subject: [PATCH v3 0/3] arm64: dts: lx2160a: fix the malformed pinmux
 entries
Date: Mon, 24 Aug 2026 23:25:28 +0200
Message-Id: <20260824-for-upstream-lx2160a-pinmux-fix-v3-0-5556ff1e6be2@free.fr>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMi2jGoC/5XNvQ6CMBSG4VshnT2mnFJSnbwP41DaU2kiP2mhw
 RDu3cLiquP7Dc+3skjBU2TXYmWBko9+6HOIU8FMq/sngbe5GXKsucIK3BBgHuMUSHfwWrCsuYb
 R9928gPML1JZfSGFjpWlYVsZAeT4e7o/crY/TEN7HYSr39Xc7lVCCEFoYZSVppW8uEJ1dYLuc8
 E8NgQPXEqWVrjJWfrVt2z5BRmxGGgEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787606747; l=3130;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=DMzETM3+OkJKc6qgpdSW8xVmC4w5CNfGRBEct9Ookao=;
 b=cNsMCCK0QIkNlo4rCG1R0e1K02J+YQVoyOlzBlxAAW49X0qq3yTtkOQsHRjJGpeJiP3Mey1sk
 ZRJfk8zPEKmBtcZKuojYklE6PV69liVxVODtihlDuaWfEYaDoMSTjAT
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
Changes in v3:
- 2/3: RCWSR14[11:12] are reserved, writing 0 to them is harmless (Josua Mayer)
- Add Reviewed-by from Josua Mayer on 1/3 and 3/3
- Link to v2: https://lore.kernel.org/r/20260824-for-upstream-lx2160a-pinmux-fix-v2-0-0a525d5f4cd5@free.fr

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

 arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)
---
base-commit: 0a0d1d55dad570724bf8c7ea83409639cfb4be9b
change-id: 20260824-for-upstream-lx2160a-pinmux-fix-6d09e82bd5cb

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>



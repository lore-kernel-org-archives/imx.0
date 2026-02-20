Received: from mx-relay159-hz1.antispameurope.com (mx-relay159-hz1.antispameurope.com [94.100.133.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF0F26C39E
	for <imx@lists.linux.dev>; Fri, 20 Feb 2026 14:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.198
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771597926; cv=pass; b=P9RAn1WfW87QyKhRpr4FKk5hYyuIEKzlHnLcYXX6r2vKROCBV9uASJIzfU6lQd8lyWUSrxwUrC89yssD1d3W3vAvL+fsWMwYXTWT9Fv898CfJqBlvltCBKJmcKSrjZsuY0b0G1AcBDwLn6BuZHxcFisLyGJ6OvKMb2B9DDarF4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771597926; c=relaxed/simple;
	bh=t20NE1VIWeOx0kqYptyI9vW/OuVswsz9RADuJpteaLs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IqQuS/gTG3d5PuZ4x0JqOWL5oE/k3wRnfHknPc8i/5C+bqjjuE0u/40H1dradrVHjstNIzMPSDXpyDEjE5GtS/YZX1DQdmPNnQ3yWNz/48O8CiiyHD4V+tqxUxn37Lb7g6Fg/YaU6hNJCvyGPBub9gqnyrEhHpbB7okBetHhaJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=cVt7Jw7L; arc=pass smtp.client-ip=94.100.133.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="cVt7Jw7L"
ARC-Authentication-Results: i=1; mx-gate159-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=9BF+iKLiPBk0pH8uiye4+X3nMfM0DDHEbLdx9fkM5NY=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771597841;
 b=OtyZ+/zzlfqXqeCsMWxeJw8D1dkBaGFAePXKDx4VgrW+6Dq4DgCQ+YU6Ugbl5reRE+X5DaoZ
 hjXeQ5Tq51iyZC0cyMDfqdYubKdkp4Yx+gcqN+H//Ebj+jAyRfCbUDm0nirEvMW8jyuWL9AgC7s
 QAwJRytLUXyd9M9n6uhfhC0oBob6sNFIROqEz3+rEpsWxNpnqkRqS7itKxd8MKG/XYYcJqmo0Vm
 SKC+3xrnDX0cmPhduaIeBroMXIYjqPDBM7FMKEtZgq8BaerosMcCKyWdFcOWTkKD4h4h+FeOSO5
 812dBEaSq6jnwhfUGqUFkHxJXO4daVHRuRcF7dSfG4zTA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771597841;
 b=ck7seHRjAdydt3Cbhag8T6l2pjzSBOnxSibBW7zd2l5ckwzsoDTqdvpN8tjqYKC9WHxk0L4Y
 kdqLHqiSN68yMojLgnUp2SdWFJ2yZ/faP3Ahtdq6iAkk36r0VfQ+tc+GgFIQOrP4/mgyYLwRBob
 Io7TNIaUhkrmhBxND6GbmSD32zMhwsHn5PolXuQkOh7v2spu7EoRZVzryzIRJON10ZyfolfZGVU
 +Ce9rdT5zWbheDNgR+oOAsZnwkE8euNrRAMuwOAQr0gvecWeiNKsYZd3w/bQpzfDZrO+tZ6V6Gu
 Q/ZMZSFooHZYQgNNQrh7HKClpAi95qcRHQdTx2l9/PPVg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay159-hz1.antispameurope.com;
 Fri, 20 Feb 2026 15:30:41 +0100
Received: from merchelm-W2.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id D59BDA412E2;
	Fri, 20 Feb 2026 15:30:27 +0100 (CET)
From: Max Merchel <Max.Merchel@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Max Merchel <Max.Merchel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] ARM: dts: TQMa6: modify for use in bootloaders
Date: Fri, 20 Feb 2026 15:30:01 +0100
Message-ID: <20260220143008.186851-1-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:max.merchel@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: max.merchel@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay159-hz1.antispameurope.com with 4fHXj04cDXzgpvg
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:e5556c3a48687fcf828e2b64ea7fecbf
X-cloud-security:scantime:2.331
DKIM-Signature: a=rsa-sha256;
 bh=9BF+iKLiPBk0pH8uiye4+X3nMfM0DDHEbLdx9fkM5NY=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771597840; v=1;
 b=cVt7Jw7LYwR5RKAOvu10Dm20wfft3ZlXzBRBQbG6i3/XD+RyycBp9ZrMrXtC8s+4xCBxGTjN
 /lCLQKx3MhUgTqtuqtK6UWk5RJU5gBbAupcpIHq9H8RH1G9gN9WUsElMmxwPUu5pv/4vhNvlJoa
 jeugMbzuovLVa4F/2QC1QDMyGty+IM7YyyrvQESNWuwavd8CW5gqqpE/0hwZ4EV7B8i3LOzKw/w
 83gko6SHqs4h9PVvg2UVnfnIWEGUvzMk5UTxnmgAY47GudGzEti0o34+cIgE9DdmGZQNN2azPlV
 qACKD8PRdvF9m/6SP/3LwLgBwKX79AXlkHUSMaafksiJQ==

This series contains modifications for using Linux device trees
in bootloaders. Changes from U-Boot bootloader are incorporated
directly into the Linux device trees.

Changes in v2:
Improved commit messages for commits that add boot-phase properties.

Max Merchel (4):
  ARM: dts: imx6qdl-tqma6: add missing labels
  ARM: dts: imx6qdl: add boot phase properties
  ARM: dts: imx6qdl-tqma6: add boot phase properties
  ARM: dts: imx6qdl-mba6: add boot phase properties

 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi   | 12 ++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi  | 11 +++++++++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi |  5 +++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi |  6 ++++--
 arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi        |  6 ++++++
 5 files changed, 36 insertions(+), 4 deletions(-)

-- 
2.43.0


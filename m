Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC72302CA7;
	Wed, 12 Nov 2025 10:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762943056; cv=none; b=jdX1LDdjJU85n8WtNXGZ2AluaJjOP7tkZoo1p3D6r2nzW9daM8tB7tlww2TIkMvhRA0fMmjfBmgOWc1v0BoEig4m5rtQqFguzY78VWhds2z+aQrRBUGqQjHxlZr2S1wKEd/Nt6R948rnxnhm7oPSUuLP+Lr6FixrtXAosi7GaL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762943056; c=relaxed/simple;
	bh=PzG1QegahEtMKQ9whdA2IidWpHZlEfCT5NYKkvlcYr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tj7hKgvTedmN07A1zXZQmpMO1/G7sf1aXWOuh47bNAi82cOe6xbXYNzQtiql3Lfd5hq/3DM/bSs0IDTqT3n/k55iHSZi4V1jAayBeGtbEL3hUxOFjGJTodYXway4ETBQ++rGEGhOkmL6gmCb5gR4DDHXwY1T4HJixFbvp7ERlO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from ofsar (unknown [116.232.48.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 7577934102D;
	Wed, 12 Nov 2025 10:24:02 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	han.xu@nxp.com,
	broonie@kernel.org,
	pjw@kernel.org,
	Alex Elder <elder@riscstar.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	Frank.li@nxp.com,
	p.zabel@pengutronix.de,
	guodong@riscstar.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	apatel@ventanamicro.com,
	joel@jms.id.au,
	geert+renesas@glider.be,
	cyy@cyyself.name,
	heylenay@4d2.org,
	conor.dooley@microchip.com,
	fustini@kernel.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v4 0/9] spi: enable the SpacemiT K1 SoC QSPI
Date: Wed, 12 Nov 2025 18:23:49 +0800
Message-ID: <176294293577.242112.11591899263367700984.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251027133008.360237-1-elder@riscstar.com>
References: <20251027133008.360237-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 27 Oct 2025 08:29:58 -0500, Alex Elder wrote:
> This series adds support for the SpacemiT K1 SoC QSPI.  This IP is
> generally compatible with the Freescale QSPI driver, requiring three
> minor changes to enable it to be supported.  The changes are:
>   - Adding support for optional resets
>   - Having the clock *not* be disabled when changing its rate
>   - Allowing the size of storage blocks written to flash chips
>     to be set to something different from the AHB buffer size
> 
> [...]

Applied, thanks!

[8/9] riscv: dts: spacemit: enable K1 SoC QSPI on BPI-F3
      https://github.com/spacemit-com/linux/commit/41d34e0b5497f919229d32580fbe34386087458f

Best regards,
-- 
Yixun Lan


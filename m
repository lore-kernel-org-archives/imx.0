Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863B632FA21;
	Wed, 21 Jan 2026 08:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768985545; cv=none; b=gRwkf0sJgJclYCYyK5gDBXAJDquyO8EV2jW7cADZILQZ3gi8qPyYqmdGvYe2aZ8D9my80xdsMClYZcHj8tI9RUTcbXKY9NP3CKJi/UTcSPID1obFZpA1y95K7h4YP7sQJfNSsRTTQMMcgc81acorHFMeGpK28Th8Sa45OxW+jt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768985545; c=relaxed/simple;
	bh=D5ht449KAUzc5+yK2DExu5/NxubUP012nBVXKyuHYSo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iziHKun5o+nWtEblO7eibCSESWou/vK16QL+SgXrdszWdaUhhAZ4WlX06HVnquIo6vu9JjB10InUy94zr6TgnxbPxThqlaRNtO40BBP7g+2JW3PjO/saA/B5UNKVQyJ5+zgfLlxDlK3TKGYJAmcO1kOK+0rmBPa85I1jkRZRxtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GH+DU1cN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GH+DU1cN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89847C19422;
	Wed, 21 Jan 2026 08:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768985544;
	bh=D5ht449KAUzc5+yK2DExu5/NxubUP012nBVXKyuHYSo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GH+DU1cNzzaJ0EtqvDv7O/ffPlXrxIEflW63r/uZknWPYScGmUZ9iR/ZTRA+Xxnyh
	 gDrWJzab8BHM6+Ixlp5vjHJRFBIOQJZaZIzKnVP8GGTkx36da7Wp1xyTLuX487lqhc
	 cIN9sYssijkbbyK9UGLWw2CC5aaVhYBol7OZX6mYX/yeK8/wjIWUBNnpBe7OG8s7bg
	 ZZMSZtgsNLJAgkCvDBRyZJzGs/o6gLOPCIcHwvyEmmGnriPchUlnE2l+lpArv+5Udx
	 5e6r0M27cB67fTSyczZ7UxztiEgREp8P5cP9fEjZAeDCh482rurtkcmZUruziPQWLt
	 D8lGmTbc6vjow==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Richard Zhu <hongxing.zhu@nxp.com>, 
 Thomas Richard <thomas.richard@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260114-phy-fsl-imx8qm-hsio-fix-null-pointer-dereference-v1-1-730e941be464@bootlin.com>
References: <20260114-phy-fsl-imx8qm-hsio-fix-null-pointer-dereference-v1-1-730e941be464@bootlin.com>
Subject: Re: [PATCH] phy: freescale: imx8qm-hsio: fix NULL pointer
 dereference
Message-Id: <176898553780.1268719.17549107476486766127.b4-ty@kernel.org>
Date: Wed, 21 Jan 2026 14:22:17 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 14 Jan 2026 17:50:23 +0100, Thomas Richard wrote:
> During the probe the refclk_pad pointer is set to NULL if the
> 'fsl,refclk-pad-mode' property is not defined in the devicetree node. But
> in imx_hsio_configure_clk_pad() this pointer is unconditionally used which
> could result in a NULL pointer dereference. So check the pointer before to
> use it.
> 
> 
> [...]

Applied, thanks!

[1/1] phy: freescale: imx8qm-hsio: fix NULL pointer dereference
      commit: 4dd5d4c0361af0a3fd24f45c815996abf4429770

Best regards,
-- 
~Vinod



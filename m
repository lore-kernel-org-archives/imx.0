Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995752BE64F
	for <imx@lists.linux.dev>; Tue,  9 Dec 2025 10:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765275490; cv=none; b=Fl6ZHWkp+CHxiON04VSl997deUTmAM0wRgeRn4OuIM5AfaGbI7CwvdYCRc7ETzNa4HwqFhSs6r/7R4v4DvB7gM+CuUaBbRFYS+4jdyADp6+4NWUTiLPUSHhbOGLN8yxYLC0NOuExdcXr+bPREUVkVoLaHDzW8CEVXtkFR4NrIoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765275490; c=relaxed/simple;
	bh=gVDFhEuBKtk+ryLzqZt9exXc1JHhsE6cex6zI+a/wSw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MA6q7EDmpjPCyVj1F3aFG8EM7rHZb5uMt6PO4jNhGUClGRTdDl6k7JTduQEaNyrCWbxLb3ddbcGdDyPtNtD0YzQvzi4dJHOfAw0ktn6gkvH3PP8OCZjOCqIncG2/Hb1f/dve0tff1tJ3Lk+8CKhp6+ZDD6UlLHcUdE5pjoI01Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=dGqAWWhn; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="dGqAWWhn"
Received: from localhost.localdomain (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 0DDD42164A;
	Tue,  9 Dec 2025 11:18:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1765275484;
	bh=VIKUHy//UsiDQQq3gFHlqMlnJn/KY2ZQoPc1PYVRHXk=; h=From:To:Subject;
	b=dGqAWWhn99ZYOeGKIu7AV2FNBEnZ4OjxTv7NodfwWxnswdRWT2DI76zBbSJ5v8ENh
	 eYpzEORqKrCAnH+xVdya6YI8CPrthXaCI5go9Z0tsxg5q9Qmr9qB/8J/7DPopVr8Ru
	 YCAJJQhrD+b/XHEDFA1YWhr7pIdlDOnacPTpPyGnSHY2hNUY8UPNNlnYxXo3AC+sX6
	 oTAXDiGNlXRspwbKNiv08aAvV//lopsFnrwXK8v+veNQWvEW1CdWXssdig2jLA3esw
	 SBKOJbq8lwHHOlPgMFVOJjyZ0Nu6Sfvt80QD3WMv+SworQKEK+2XwEbAQDm5fZj1gI
	 HbmXypB0hoSag==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] arm64: dts: freescale: imx8mp-(verdin|toradex-smarc): Add HDMI audio support
Date: Tue,  9 Dec 2025 11:17:48 +0100
Message-ID: <20251209101754.54067-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add support for HDMI audio on Verdin and Toradex SMARC iMX8M Plus boards, as
done in commit b21f87b8322f ("arm64: dts: imx8mp-evk: enable hdmi_pai device")
on the NXP i.MX8MP EVK board.

In addition a small cleanup on spurious comments.

Francesco Dolcini (3):
  arm64: dts: freescale: imx8mp-verdin: Remove obsolete TODO comments
  arm64: dts: freescale: imx8mp-verdin: enable hdmi_pai device
  arm64: dts: freescale: imx8mp-toradex-smarc: enable hdmi_pai device

 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi    | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi       | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mp-verdin-mallow.dtsi    | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mp-verdin-yavia.dtsi     | 4 ++++
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi           | 4 ----
 6 files changed, 20 insertions(+), 4 deletions(-)

-- 
2.47.3


Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE02E3BD22C
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 12:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784290744; cv=none; b=sW4bynGSsVKFnMtqjwb28HvTcjqBk5rcVC06tNAvnkLjm2GkNpcQxfPQZBNOu4nKxm2a+6XQn6f2/EFNt+olPo3hEiJ/dDJ3H7O4UvnO0QyxlKr04PhVh5loZDc2OQrNqKMEXjJFUqvp2ej1c9GyPt+U6TXyRSNZXKkyY32OmDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784290744; c=relaxed/simple;
	bh=Jcspbn+y4lvPxfEi7rGYp9wfAP06fc+vXJWSLYlne/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=puUzKONbmlCCAo5+hQ9+56lkX8T/o1dsoyp9WIhgufB1IonYB9t7s1fCjiyYm5vMRLBvFuLG1/ebollWq8rweEfUcYdc6gmUYjWxzJJdVgfeYHkalWt2/NElqbhXV9k+agfxemmvFPgpZQgGd59exIhtGi0yLEQnY+KU6tN0ak8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=APwKamzG; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="APwKamzG"
Received: from francesco-nb.. (unknown [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 2CC44228C9;
	Fri, 17 Jul 2026 14:19:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784290740;
	bh=MhJPiBOn7qoBvAbf8Au6wuw+Yg8j8KZ2eCw0H8HfrZc=; h=From:To:Subject;
	b=APwKamzGhTxH89PZZJMs3OKR8EHU6NE/1uaK2jb0GSO5SInwHyKlvzrBiXuw0dsTl
	 xKC5yH3MjY1dvjqoF4sPT9duWOx3fNwRRiBh9OagOWEyhePyZJXE1yJ4lZ6wOE6WoM
	 8hCTavJ5O/Y9BUoDN5ott6LFfdVs2Yfj/bDrLU259HFAAlZC/KiSqsnDhNjoyhE4pX
	 1j9IQJSNmoW2K9uWf9VLuwnpBxz25pCm8yCta7SYo+Tg8tU25Nhjd7H0Epw8TeNqO4
	 cAUr2pyrIfGjgrBI4ZJyCNjPRFn2gHnMQDrvbwYqfF20MeEQvSsHXT7YYkTBZIgXuN
	 2kre9RHrlT+iw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 3/4] ARM: dts: imx6ull-colibri: Set LCDIF format
Date: Fri, 17 Jul 2026 14:18:45 +0200
Message-ID: <20260717121847.488148-4-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260717121847.488148-1-francesco@dolcini.it>
References: <20260717121847.488148-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The lcd DPI interface on colibri imx6ull uses a 18-bit width bus, set
the interface-pix-fmt accordingly.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
index ec3c1e7301f4..e126fade2304 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
@@ -225,6 +225,7 @@ &lcdif {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lcdif_dat
 		     &pinctrl_lcdif_ctrl>;
+	interface-pix-fmt = "rgb666";
 	status = "disabled";
 
 	port {
-- 
2.47.3


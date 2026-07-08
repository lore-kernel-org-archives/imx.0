Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F36420883;
	Wed,  8 Jul 2026 09:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504612; cv=none; b=XXgX2z6rZJ53o7hSOaZn1LWtR4RfiZvlBJPolyTRQyZ2RyrHYoIW1eGb1gVhbxNxG8h4NGgkTF9eRRAtPrLPC0h66nlJGxc+fzgGFlzGTpTJeJ/DcjcW2BjPofJnp1zBIDz4VNuADUTCGVg62yFSW+7kQuJHxBNBOsjsoMzNpWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504612; c=relaxed/simple;
	bh=E3PjqcHSVjrlBsvzlQTx6J3vANorpjqGUjPlrAPBNis=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ilnKzqVb/IqQ1R25tnsfJWAHaemcGfvpNNu4egsK2fCZx/bMxLPRAjFPkcsh/V/SlpoM5+dN++ErAPQ+0mpTrxa56Su0LPePdTTv/x/adtvD6ADbi1ZhQx8mYlt84iUiVUTA/J6vt6d3Rprd+524dcO45gL9ikqtEtIxSPw4zzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BYgAx0qK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BYgAx0qK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BCF41F000E9;
	Wed,  8 Jul 2026 09:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783504610;
	bh=pdc8kUJhsaq8N1r0m6ge5yol36Y1IShouOM/AGoYtqI=;
	h=From:To:Cc:Subject:Date;
	b=BYgAx0qK9olgdiSMsctTirYk+2OK+/P6NF8jVdupbK4WVeCQYnBZPMzljrqEki9Hi
	 g63ETnn2EcLzAc5m1SXYmJ0Igg4HRO2THScLohlbmm3aGf3D7BuXkCGEBJyzH240mT
	 W/mexf9Dvgleiv/2vFoRICj0wDJrmL9EdfC9L+L+ljovAbL4tBe4IA5IKsg0JMmBYR
	 X5XmeQAIGy0SNtHzaKJ7FcAaHoSS9bl7Hhk3m0VeP7exEZLc7mpK1unJX1GFWXd+RT
	 OlHi01cNAUq4nB2fx2BwtoLbmsK5OMY1xEvbriF7QcNJF1mWXavaZgUMmE447qrdKG
	 wYRlPrLoIfemQ==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: victor.liu@nxp.com
Cc: linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] drm/imx: Switch to irq_domain_create_linear()
Date: Wed,  8 Jul 2026 11:56:44 +0200
Message-ID: <20260708095645.385291-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

irq_domain_add_linear() is going away as being obsolete now. Switch to
the preferred irq_domain_create_linear(). That differs in the first
parameter: It takes more generic struct fwnode_handle instead of struct
device_node. Therefore, of_fwnode_handle() is added around the
parameter.

Note some of the users can likely use dev->fwnode directly instead of
indirect of_fwnode_handle(dev->of_node). But dev->fwnode is not
guaranteed to be set for all, so this has to be investigated on case to
case basis (by people who can actually test with the HW).

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Liu Ying <victor.liu@nxp.com>
---
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/imx/dc/dc-ic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-ic.c b/drivers/gpu/drm/imx/dc/dc-ic.c
index a270ae4030cd..d8aa46ee6a7a 100644
--- a/drivers/gpu/drm/imx/dc/dc-ic.c
+++ b/drivers/gpu/drm/imx/dc/dc-ic.c
@@ -174,7 +174,7 @@ static int dc_ic_probe(struct platform_device *pdev)
 		regmap_write(data->regs, USERINTERRUPTMASK(i), 0xffffffff);
 	}
 
-	data->domain = irq_domain_add_linear(dev->of_node, IRQ_COUNT,
+	data->domain = irq_domain_create_linear(of_fwnode_handle(dev->of_node), IRQ_COUNT,
 					     &irq_generic_chip_ops, data);
 	if (!data->domain) {
 		dev_err(dev, "failed to create IRQ domain\n");
-- 
2.55.0


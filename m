Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711277;
	b=IX2SVL6wmXDDHmRncTXSlOqMe59/UjWmXNx4BCcO96yoIKd+eliX0pZbmyxUyXdrlMVv
	 nCGQvQ7ShhJ+ZufWMaWdBxTS8rGkjFLBzfq07AVGpJvH0GbEJO38WGYuHdqmGfzKP95Fa
	 nDzdSZTRPyFt+AjeAajr6PPZuop7JUU0eJw74+EiFnQfzjQlmGLgYe5c+WenowgreRQln
	 YtaoBS1mmX1kFC+/YBxEtx1Ar1lHj1wvc7bdYQ/XAQz+7MxMlWypS/NpnNbVbWpj17R9m
	 unScslFZ6I1XgDdsGAZSD9c/WmF/Qe8Cy15PGDdAjHDMUMBtcG6/6gjG5K+R8uP55SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jU16bWHumwV20jpiMrBRT2UNHlED4a7CUl264/set1s=;
	b=EoDmZI57ZbpnDCVK5FdM8i3YE8w80L0vm6/n4/JqxFy18Hg0/HBuA8ri0EDEq/hzCPQE
	 ocxc2j3b/TyofJ4w/KMkWHnUTctLBjYlGgY3Iq01SRI4TbbRm/kYy78lyESoib/2PZ1rQ
	 6H4u0SLse1mJiPEbnRoJTIRn1mtZnHWXi6HS+fnKDyfJFSu4CzEHlC44qR15enosWuSzb
	 hjTrCJxnsrTWR3mXA+FYNnUfG3JW5EvZu4gs9tr27EhGvl2KlWmjSE8XuwclfgeMubP9+
	 m2ru3JRoWdAFtMtVdLhj3E6WRtWn4/RZVKUeWok7lxZpy7ORrAj+OiC5CHCKmB6sDZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jCL+e2Ct;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8995D606A336
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 16:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8995D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jCL+e2Ct
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso3315112f8f.2
        for <imx@lists.linux.dev>; Thu, 26 Nov 2026 08:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795711275; x=1796316075; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jU16bWHumwV20jpiMrBRT2UNHlED4a7CUl264/set1s=;
        b=jCL+e2CtLs90ZZw54ZPnVQVjf5vYhkmT69LYXhQAT67a6puwK77Ct8vfm6UQbBLbmy
         pM/qy6nlMmL6I/bND6yrpNrKFIMO13D9cK5gejtmDK/WNPxkI6I+2G4kHcEGaxviYOqV
         FWrB+eFTHsMU9jvTROpmpmCXQpmG2tOj7sWj1rnWUmW1ssabGZ/8mhKOHd2SKwwmtXm8
         HPM49PLqlYsIz2gvzh3j+qfGm7iS0GFmjRSf5NZntKY5TgCzNGWJ3vZAObVbQ9HvL9lV
         n8c+sgles4IY/g/iTn69NHelANGkaUpepaq0UjST0mCmPQNQ/331vDFNSG05JoT2xYxP
         H0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711275; x=1796316075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jU16bWHumwV20jpiMrBRT2UNHlED4a7CUl264/set1s=;
        b=Qb5OZBz+TSO+Lc6fdbqUkZksSK7LiBY22DdVm+9UWjrUU4NRSITfLGuky5uAQwi4rY
         VGobXYkbacmoypQa3Gzu/f1GPGHmXd4BvXfhUpmfl+GDAI1vT+nPo4+iSUP09UxZVxpA
         C0oQbH5KneMSzxW5majQURlP0vykYvofNHtSb9PJ9Cg0ScxiGoGCafIfZ7fbdakaQhec
         39a3fNp874KD5f0UlK1+lfSbsetnzPMz/tEbcsSztmG2JaaqLQdoL2oGQl50UMMbPGeF
         GaqjDq4eOa8/r80EJGCAVc0Ad9OB6t/uuZCz7HHsPeH7IpIapdv6GQkungHCdJCXX0M9
         YKaA==
X-Forwarded-Encrypted: i=1; AL+hErG+iqhhalQ8d3zvAPT1ApclueHTrGGQCwuTEL62jBPSnfoB5YmAElIuHxLH5N5NHUbyDys=@lists.linux.dev
X-Gm-Message-State: APuU4Z8So0dbGhhaRfZBEhX8bPLp7hjKAtSKsbv3MJP2oYWAlplcDYTi
	wb5X4cJkgEYK8bYOiNhEEQUrheu5GiA+0cXsjl5uZimjQvQ0kmMTtBCB
X-Gm-Gg: AZFdTZcZjpk5ahBclWBttv9hmWhut3N2or5/QhR3gquKxxa1IXFkjGjar6q31leSTPV
	3sgJVoxZDrRnHLHjdmvKxfIQq1tdctA9iVnws5Ceq+po0WEIFFczXFOXw8UkPu9s08t4PiwCHWg
	jRZW0Uqgdk4AgJeomHISx2MlWtF77DSf0I76nngQggVnW5H01mEwrflKIH375BaQKAhGQkbhfLJ
	WSvtDTGSkqoHWzJ0LY9OYFrv6lwdrcEMO5miX+YxhU6UMQRgkP1J9wnjnrot2o7dXnhXkX0ayVB
	xjMPZEOXVHJQ8DLrvs90AyMJ3+9Q33WYVlo8I797HwLJJHkaxxrdX94JAZvHmwYHz7QeYf41OoV
	aYO47BS7NwXJWhCPI5Az2FiU6oJFvjFSeaFEIH7zcyqZsjOYhu/Fze9NvR14bBNqem5Y+6/CgbJ
	VvxgJiJOirHw0yR+P1ibwEXnl4kNcQFTbWqdqeflM+9zdaBs3XRtDwN/2Jqh1PhlhYVxUs+OPZz
	Y6VCEZOzR6gf3MTkzI1wSf7gDJ8OOP+rGuufh0Cwd9qmaHsCYqX9YlZpNsAjFXDhC9VWLZCy2bt
	7x/TQElSrgqD21Tr9zvL1JdNLh3wvrbWOIG4rw03itOtY/5IQMrDopQ=
X-Received: by 2002:a05:6000:4b1e:b0:48c:7143:610c with SMTP id ffacd0b85a97d-4abb2910b8fmr41814928f8f.36.1795711274674;
        Thu, 26 Nov 2026 08:41:14 -0800 (PST)
Received: from vitor-21h1cto1ww ([2001:8a0:c4c6:f00:6ce3:c28c:2097:7d09])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm39333942f8f.34.2026.11.26.08.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:41:14 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lucas Stach <l.stach@pengutronix.de>,
	Advait Dhamorikar <advaitd@mechasystems.com>,
	Marek Vasut <marex@nabladev.com>,
	Peng Fan <peng.fan@nxp.com>,
	Adam Ford <aford173@gmail.com>,
	stable@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v2 2/2] pmdomain: imx8mp-blk-ctrl: fix suspend/resume order
Date: Thu, 26 Nov 2026 16:40:59 +0000
Message-ID: <20261126164058.2373605-6-ivitro@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126164058.2373605-4-ivitro@gmail.com>
References: <20261126164058.2373605-4-ivitro@gmail.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

As in imx8m-blk-ctrl, the GPC domains behind the HSIO and HDMI blk-ctrl
are driven through the virtual devices from
dev_pm_domain_attach_by_name(), which have no parent and no device link
to the blk-ctrl or its consumers, so nothing orders them in dpm_list.

On Verdin iMX8MP, with the phy-fsl-imx8m-pcie module loaded after the
HSIO blk-ctrl has probed, the virtual devices are suspended before the
PCIe PHY, and the CPU hangs in genpd_suspend_noirq() of
32f00000.pcie-phy with the HSIO bus domain already off. The system
never completes suspend to mem.

Add a stateless device link from the blk-ctrl to each virtual device,
bus domain included, so they are suspended after and resumed before the
blk-ctrl and its consumers.

Fixes: 556f5cf9568a ("soc: imx: add i.MX8MP HSIO blk-ctrl")
Cc: stable@vger.kernel.org
Co-developed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 drivers/pmdomain/imx/imx8mp-blk-ctrl.c | 29 ++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
index 212d491c75e4..e967ae7eda30 100644
--- a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
@@ -657,6 +657,17 @@ static int imx8mp_blk_ctrl_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(bc->bus_power_dev),
 				     "failed to attach bus power domain\n");
 
+	/*
+	 * Make the genpd virtual devices suppliers of the blk-ctrl so that
+	 * they are suspended after and resumed before the blk-ctrl and all
+	 * its consumers.
+	 */
+	if (!device_link_add(dev, bc->bus_power_dev, DL_FLAG_STATELESS)) {
+		ret = dev_err_probe(dev, -EINVAL, "failed to link to bus\n");
+		dev_pm_domain_detach(bc->bus_power_dev, true);
+		return ret;
+	}
+
 	bc->power_off = bc_data->power_off;
 	bc->power_on = bc_data->power_on;
 
@@ -716,6 +727,15 @@ static int imx8mp_blk_ctrl_probe(struct platform_device *pdev)
 			goto cleanup_pds;
 		}
 
+		if (!device_link_add(dev, domain->power_dev, DL_FLAG_STATELESS)) {
+			ret = -EINVAL;
+			dev_err_probe(dev, ret, "failed to link to %s\n",
+				      data->gpc_name);
+			dev_pm_genpd_remove_notifier(domain->power_dev);
+			dev_pm_domain_detach(domain->power_dev, true);
+			goto cleanup_pds;
+		}
+
 		domain->genpd.name = data->name;
 		domain->genpd.power_on = imx8mp_blk_ctrl_power_on;
 		domain->genpd.power_off = imx8mp_blk_ctrl_power_off;
@@ -726,6 +746,7 @@ static int imx8mp_blk_ctrl_probe(struct platform_device *pdev)
 		ret = pm_genpd_init(&domain->genpd, NULL, true);
 		if (ret) {
 			dev_err_probe(dev, ret, "failed to init power domain\n");
+			device_link_remove(dev, domain->power_dev);
 			dev_pm_genpd_remove_notifier(domain->power_dev);
 			dev_pm_domain_detach(domain->power_dev, true);
 			goto cleanup_pds;
@@ -775,10 +796,12 @@ static int imx8mp_blk_ctrl_probe(struct platform_device *pdev)
 cleanup_pds:
 	for (i--; i >= 0; i--) {
 		pm_genpd_remove(&bc->domains[i].genpd);
+		device_link_remove(dev, bc->domains[i].power_dev);
 		dev_pm_genpd_remove_notifier(bc->domains[i].power_dev);
 		dev_pm_domain_detach(bc->domains[i].power_dev, true);
 	}
 
+	device_link_remove(dev, bc->bus_power_dev);
 	dev_pm_domain_detach(bc->bus_power_dev, true);
 
 	return ret;
@@ -795,12 +818,14 @@ static void imx8mp_blk_ctrl_remove(struct platform_device *pdev)
 		struct imx8mp_blk_ctrl_domain *domain = &bc->domains[i];
 
 		pm_genpd_remove(&domain->genpd);
+		device_link_remove(&pdev->dev, domain->power_dev);
 		dev_pm_genpd_remove_notifier(domain->power_dev);
 		dev_pm_domain_detach(domain->power_dev, true);
 	}
 
 	dev_pm_genpd_remove_notifier(bc->bus_power_dev);
 
+	device_link_remove(&pdev->dev, bc->bus_power_dev);
 	dev_pm_domain_detach(bc->bus_power_dev, true);
 }
 
@@ -815,8 +840,8 @@ static int imx8mp_blk_ctrl_suspend(struct device *dev)
 	 * can power down our domains and more importantly power them up again
 	 * after resume, without tripping over our usage of runtime PM to
 	 * control the upstream GPC domains. Things happen in the right order
-	 * in the system suspend/resume paths due to the device parent/child
-	 * hierarchy.
+	 * in the system suspend/resume paths due to the device links to the
+	 * genpd virtual devices added in probe.
 	 */
 	ret = pm_runtime_get_sync(bc->bus_power_dev);
 	if (ret < 0) {
-- 
2.53.0


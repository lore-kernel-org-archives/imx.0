Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B1417D35E
	for <imx@lists.linux.dev>; Thu, 30 May 2024 08:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717059522; cv=none; b=UpAfinYTH0mFnYhFyuwa1z7zag58MV/V01PPeBKp5ihgq/zlybQv/+FhLoLPs5MxFXeDGg8JFEaVNMme+PFEDssoxF7lUmArcZEsD5Y+fRzeSVdBLunXlchpVXGyjL+Wd3ML7mbeJUF/62RfRqlTiGUwUlbd9DpEZ9psUOVlr2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717059522; c=relaxed/simple;
	bh=AtdSj8Gi5BjDdlTV9ZqdN7OUIGwv22hj9Vwr0vi/QVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HvC6DXoqCWOIPY2KMAhk3y2NQgzCcG44AwtD1S/ihDQmKvVS0aEKVvpXzGfpc6XtMi9eKU+cm6mL5Ly9nGOrIsmv0cZJQIaKk/4E5YSCQjBYL8ws5loYbdM2QgAq8GI8LmHxGuULPBiRQbHgHKQUBab4qTKiIoIQro3jjXsBAgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id cd6d5db0-1e62-11ef-8e2e-005056bdf889;
	Thu, 30 May 2024 11:58:37 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v3 11/11] pinctrl: pinmux: Remove unused members from struct function_desc
Date: Thu, 30 May 2024 11:55:20 +0300
Message-ID: <20240530085745.1539925-12-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240530085745.1539925-1-andy.shevchenko@gmail.com>
References: <20240530085745.1539925-1-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

All drivers are converted to use embedded struct pinfunction.
Remove unused members from struct function_desc.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/pinmux.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index 9b57c1cc9d50..2965ec20b77f 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -134,16 +134,10 @@ static inline void pinmux_init_device_debugfs(struct dentry *devroot,
 /**
  * struct function_desc - generic function descriptor
  * @func: generic data of the pin function (name and groups of pins)
- * @name: name of the function
- * @group_names: array of pin group names
- * @num_group_names: number of pin group names
  * @data: pin controller driver specific data
  */
 struct function_desc {
 	struct pinfunction func;
-	const char *name;
-	const char * const *group_names;
-	int num_group_names;
 	void *data;
 };
 
@@ -151,9 +145,6 @@ struct function_desc {
 #define PINCTRL_FUNCTION_DESC(_name, _grps, _num_grps, _data)	\
 (struct function_desc) {					\
 	.func = PINCTRL_PINFUNCTION(_name, _grps, _num_grps),	\
-	.name = _name,						\
-	.group_names = _grps,					\
-	.num_group_names = _num_grps,				\
 	.data = _data,						\
 }
 
-- 
2.45.1


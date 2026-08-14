Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24672490BF6
	for <imx@lists.linux.dev>; Fri, 14 Aug 2026 19:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786734348; cv=none; b=c4dIHfRHTYrDAiyluTezx4nnCNFNaVdHBWgf0WJJ7mM5lmfAhPjCgu8uoj0RQZZvWgHwRfrnW0qewwUa9UQbsFeAfEpdD96rO1qU+CsjWs3m64khJwkYt4eBRvWsZtbSizMIe99ev9mO2+GyMPpTWfmXNQ4giljh35/LlAeyl1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786734348; c=relaxed/simple;
	bh=6Wp1pMcM5hwaADkkdcdckZfs3h1zttS0Kz4AOfE7Occ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gJqfQxJSNcIyaxxRolboVhl2o23R1Z4iLZ2cBqmrOVviB7sjGCpVYqM6Tpjf4sRwYAGdTxSEijd5hAp0i2FQOUapbFLHfOPH+7vDDcTUR0spgu9Pg5A/sv84EjwTHrbs14SgPFSUSDakQyox3S0F1MHUNVsc2kInBpfko3s/0dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AlZIJkE/; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AlZIJkE/"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbedf433a99so1255130a12.2
        for <imx@lists.linux.dev>; Fri, 14 Aug 2026 12:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786734346; x=1787339146; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fnPkLJqZQz4hKZtS8FG6LEBJCnBc6ph4JdLLK3tJlY4=;
        b=AlZIJkE/MuF7GRNEkqu/7JsJnORyyHfQe2jTP53PEW3KIWFdmwF29k3siJfHhWk3sw
         ca/QWHutL5QBxeR1PBHANIeSQIwMvs1pb3vLmN0uVpo4GcjC+Qv4fda186WkACc+A4PT
         vygv6R+SEgOcNGnbRdZJeml/jhf2Jv5pkkWsDKIerxoQQOs5JUlu6NGC1Z+JjUrDW3D5
         xXu1SRtgXNSqK3FpRWbIzJn7ij55Domp7I6Nczxlh04oi1bFI4y5cn+RfxnWU3swNJu1
         T6StUoC2XP49n+NpEUx/HuWMKbmq/uqGCyL5dQ5IfIZbVWwyqZ/3BeBL6PmO/XW7zjQN
         F8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786734346; x=1787339146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fnPkLJqZQz4hKZtS8FG6LEBJCnBc6ph4JdLLK3tJlY4=;
        b=Pim/QOLbURaErC3/5+uxO1DnZBa2zgPFn4K6geM1+I5et02Vy44pJ+dOvGy4RcqV4G
         z0rJNZ/HnqU8QL8ePBS3s0RH0X+EvmXswAQuimXjGK1mANwzD3A2/4DEUFjFkw+JuymE
         VTDRoyBo0Gy0DQd2x1F0oW3ha8EbjBsIfKYsFyjGazrimavU7bbWekXkeXS0NlOh49Dk
         5fEV5OX7KG/VmxAbzZr/iqFL58IqiGxuO8XjyUJnFcxOaZkZIU3343rqWDCu1UqsbjYr
         vUIsq45Dm11VEdRpphjkfk/lk4f27ZePqYNmU+hezngfOjdw1b84oVXUuBebF/0DnyKx
         bRxQ==
X-Forwarded-Encrypted: i=1; AHgh+RqbyZYMhTqtca62fXZYH4v8if3RTq2qxupK9FcgH2Du0b9BBQA+7KOZqpnZlipEen0pr5E=@lists.linux.dev
X-Gm-Message-State: AOJu0YzCD8rLufaohWnJKNwo1lGzGAo3XWyGlM33akBmCAI4YdPYZ2LG
	jgAm3elCk1b4V6D/z4Jfb6qP5k0LgttB3HOcyX78Ou3BWHxfs2USEeCY
X-Gm-Gg: AR+sD12iyo/pf+g5OyhaSV65U2QuqGqXr5CgM5As+SVs2tYJzY1zxsrE5Liid30kAw2
	RcGMXcFdWHmNN13hrZEtHS69Nm/X5QZnuCFT0iSJvruLuvuwwKHnYFsXKW5lpTJwGUBwCKW7az+
	SvHFhUNQlNJtWw+15ObyKOD1mXXjGlkxDwkQgtuJ1798denTkgUIwuvqcjNNutAYU0ajYZSbyD9
	hBISxrHE3vFNuL2UF2JmELIJGGI72nL6CBi+fNbrvGW0Xx9AWXvyHTuBvzP0YYS4IA2+V5OrWqK
	OTJ0sPeWUkIWutTUxtnamw2KXbbwZAaB2kUbgpAvJ9D1wfrEWT67XaTmpHJ7jkt7X7NXtHVRAFQ
	3ugTLXod3yg8uIqXf+XPG+/iucWa2Jm2E9qHWNxfvPbYLdwVSJNz41sg1UJ7iESTuGeF5p/p0uY
	/Jwx/GlTtmQ3bZlK144WqlUCOkIRVQoK5rnOcTKM376ZDgkJxmDr+WWd6CfTBt118OkUBeckCea
	iuTzdENapscVmcjKniqiaGVsqtTSRy36A9JWMTjjIAkO2ojpyEgMkPWFtVAxeQBFx8VLsVYScKr
	SQ==
X-Received: by 2002:a05:6a20:d48e:b0:3c4:1916:9d40 with SMTP id adf61e73a8af0-3cc71a2c76bmr10428980637.12.1786734346257;
        Fri, 14 Aug 2026 12:05:46 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:94:ab62:887d:e555:df21:3318])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d66e52d2sm7081695eec.13.2026.08.14.12.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 12:05:45 -0700 (PDT)
From: manushprajwal <manushprajwal555@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Manush Prajwal <manushprajwal555@gmail.com>
Subject: [PATCH v2] pinctrl: imx1-core: fix device_node refcount leak
Date: Sat, 15 Aug 2026 00:35:27 +0530
Message-ID: <20260814190527.969-1-manushprajwal555@gmail.com>
X-Mailer: git-send-email 2.46.2.windows.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Manush Prajwal <manushprajwal555@gmail.com>

imx1_pinctrl_dt_is_flat_functions() iterated child and grandchild
device nodes with for_each_child_of_node() but returned early from
inside both loops without dropping the reference the iterator held on
the current node.

Rework both loops around for_each_child_of_node_scoped() instead of
adding manual of_node_put() calls, matching the sibling helper in
pinctrl-imx.c and imx1_pinctrl_parse_dt() in this same file, which
already use the scoped variant.

Signed-off-by: Manush Prajwal <manushprajwal555@gmail.com>
---
v2: Use for_each_child_of_node_scoped() instead of manual of_node_put()
    calls, per Frank Li's review.

 drivers/pinctrl/freescale/pinctrl-imx1-core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
index b7bd4ef9c0..fa8f6a7e03 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
@@ -547,14 +547,11 @@
  */
 static bool imx1_pinctrl_dt_is_flat_functions(struct device_node *np)
 {
-	struct device_node *function_np;
-	struct device_node *pinctrl_np;
-
-	for_each_child_of_node(np, function_np) {
+	for_each_child_of_node_scoped(np, function_np) {
 		if (of_property_present(function_np, "fsl,pins"))
 			return true;

-		for_each_child_of_node(function_np, pinctrl_np) {
+		for_each_child_of_node_scoped(function_np, pinctrl_np) {
 			if (of_property_present(pinctrl_np, "fsl,pins"))
 				return false;
 		}
--
2.46.2.windows.1

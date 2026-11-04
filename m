Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758463;
	b=Rxg6LxOmLjZhoFYfk09dJg8k+ei+m01dpXe2H5jILxWMOhCOwQh9SF1XNjCWn9dBz7Dp
	 whfJXoliUmvfjfrK2jnH6x8ZdlbFcvTTtCn9jbBuqAvFP++mV0u6Idfv0kJoU6EG1KC6P
	 WpcrhSBCTyeTrfrVt3B2VF9jCHiYWFG5FxR4xPeABLKiQkgOdQGrcq2WQH2MdK/E9Y4qp
	 Wytc5F8rdncOjYF5QcKPxu9QvMWNIWcYHFc/7DbvAtePs2kHwu82h6T3FIc9bQKUk9z+q
	 iTW2Mvg5+nhDX6zPNtJIzbLkip3XHrl8hJRYwoodjIrxjqPV3SH+/vY1EtL8RXK3qhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758463;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=TYRqf8SxDsnt8B8owVMBE2jjjSA1FnrrLs/K1Qc/5MU=;
	b=Laim/PzYI+Yu0QoOU0n54NafnrPHjipigvM89bUoc6Zs9o3geYclmUTxULihkPKKZO1T
	 5J+EWWZ34qBKju55MfBEQgbU4+x3sZ/urh0AHuzg4IHJtaeukHJIHWlzl2rFtl3nmsGi+
	 ihynYqx1e3Nc/+SYgs+3VvXakcXy+xkDdf/0PEzw+DBNcc1qYisTugggBJE0oUuLKrhs+
	 4VLfn5Lp620f4bOXr4dgTsut5u+mhH+37GT2+4uwjR/K5QERxElASFlrocNobSkwSldBA
	 X4v2MERCFNHUoRLsIp/kBgULLZ/DGol8RiKMbYvbl1Rw6aywuK9h7dQDvt0mfWsTj7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4F1606A328
	for <imx@lists.linux.dev>; Wed,  4 Nov 2026 02:14:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD4F1606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowABXgvz8lOpq+HQ+AA--.9646S2;
	Wed, 04 Nov 2026 10:14:20 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] soc: imx8m: drop the clock reference if enabling it fails
Date: Wed,  4 Nov 2026 02:14:29 +0000
Message-Id: <20261104021429.1468237-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
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
X-CM-TRANSID:qwCowABXgvz8lOpq+HQ+AA--.9646S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GFWDtF4kZr1fWr4DZF1UZFb_yoWkAFg_ur
	48W397W3yUur9rK34UGw17Aryq9Fn7Xr1kW3yqvF4rKryUZF1UuFZ0vrn8G3srXw45JFyD
	CF18Xr4xCr9FkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbs8YjsxI4VWkKwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4
	kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_
	Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI
	0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4
	AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAK
	I48JMxAIw28IcVCjz48v1sIEY20_Gr43Wr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
	IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
	6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2
	IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280
	aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43
	ZEXa7IU5gZ2DUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBggBA2rqY4K7IAAAs2

imx8m_soc_prepare() gets the OCOTP clock with of_clk_get_by_name() and
releases the register mapping when clk_prepare_enable() fails, but the
clock reference itself is left behind.  imx8m_soc_unprepare() only runs
on the success path of imx8m_soc_probe(), so the reference is never
dropped when the clock cannot be enabled.

Put the clock before jumping to the error label.

Fixes: f6ef3d9ff812 ("soc: imx8m: Fix error handling for clk_prepare_enable()")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/soc/imx/soc-imx8m.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-imx8m.c
index fc080e56f50d..70b281927c4b 100644
--- a/drivers/soc/imx/soc-imx8m.c
+++ b/drivers/soc/imx/soc-imx8m.c
@@ -149,8 +149,10 @@ static int imx8m_soc_prepare(struct platform_device *pdev, const char *ocotp_com
 	}
 
 	ret = clk_prepare_enable(drvdata->clk);
-	if (ret)
+	if (ret) {
+		clk_put(drvdata->clk);
 		goto err_clk;
+	}
 
 	return 0;
 
-- 
2.34.1


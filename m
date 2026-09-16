Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A14938888E
	for <imx@lists.linux.dev>; Wed, 16 Sep 2026 09:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789550893; cv=none; b=F/2al5v99VpCnkBImzzCHHoL+O91p+fQ8juA2GtsFWqTg6FgDtidmVOE5k5hKoPF2BvVdFxqav+2rRhOfbmg6JN1+R3e6PIWRKzQ5rHqi0w8/XUR/LsKD3UcyfQXBFaijIIyjGwCANo7BLtSqfMqClJVkEbT5/e8MsgTtA0P13E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789550893; c=relaxed/simple;
	bh=e0CSG2BEu5l9qTKF+UJxzpJzGObsgBtEZ/67en5f4fI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KX3yOhveJ+Mc5TBh9vS2OT4bQUckeP+RZmhd4ODSNop367HJ1DTfi1LCab/agFuKnME6iAPwPtNCQK+qmYP5lA+Xni0PYJiVfp+W2nBoebnGyfN5eVbhRL4IAMdBw0fVtlugK5tyIaBme0+mTBIi794/Vuj724HnBcEtSAqjQwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowACnqTchYapqrFPgBw--.42435S2;
	Wed, 16 Sep 2026 17:28:01 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Frank.Li@nxp.com
Cc: dmaengine@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vkoul@kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] dmaengine: fsl-edma: Fix channel leak in fsl_edma_xlate()
Date: Wed, 16 Sep 2026 09:27:33 +0000
Message-Id: <20260916092733.2002700-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACnqTchYapqrFPgBw--.42435S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKr1rJF1fAr47Jw1fJw1DZFb_yoWDuwb_W3
	4DGr93Zr1DCry7Cr18Krs8ZrWv9rWqgayfuw1qy39Iqas8Aw13Xryjqwn5Xr1UWFW7CFZ8
	t3WUZ345Zr1fWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbxxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j
	6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUO2
	NtDUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwIMA2qqQJWI5gAAsx

fsl_edma_xlate() grabs a channel with dma_get_slave_channel() before
validating the requested srcid. If the srcid turns out to be invalid,
the function just returns NULL, leaving the channel with its client
count elevated and marked private, so it can never be requested again.

Release the channel with dma_release_channel() before returning NULL.

Fixes: 6aa60f79e679 ("dmaengine: fsl-edma: add safety check for 'srcid'")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/dma/fsl-edma-main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
index 36155ab1602a..11fbf6b1609b 100644
--- a/drivers/dma/fsl-edma-main.c
+++ b/drivers/dma/fsl-edma-main.c
@@ -279,6 +279,7 @@ static struct dma_chan *fsl_edma_xlate(struct of_phandle_args *dma_spec,
 				if (!fsl_chan->srcid) {
 					dev_err(&fsl_chan->pdev->dev, "Invalidate srcid %d\n",
 						fsl_chan->srcid);
+					dma_release_channel(chan);
 					return NULL;
 				}
 
-- 
2.34.1


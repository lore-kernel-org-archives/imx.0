Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.164
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899695;
	b=fmmWgtITINzKoBW5praoPhLsiSxsxbwEEXGpp/5snA3rvQsmU1vsjQ3HdVVlFvuiVSjy
	 OfGqqCQAFUOP5l4cLqKwq4OtbHPQJZpZ2Y7fhqdIjew4bab3m1u6RcoHALcMleZ5b4Wdu
	 oLrY1ZX5jupxKT2CXBLdqEJPT0HvVLsnmj0rqcmZZKFchlUiK08FYfgwwJS+PSfiD/TQ6
	 SakIsUjvjcoHcNO/xI/X3AcbrmZbAtEtimxjJyaniVHN5V1WJK3QRRm+beeBshd9LwwMs
	 eUBs/VgyFnblcrdCVVlPGLUs9wxGhPS09G8vWhe+u78aUT3R8xfYpVrmwedPjVOs6rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899695;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=7i5qcP5sxivInnRUrN+Klf/63NaDFtusfexk9BVAIbk=;
	b=lNqtfNVkcccDxbr+BBLh1vIW/eQ8A9whhnez1FfG6WYHvPO3gaCHVqqzOL+wtT4aU1FR
	 cIR+bPlLmUh14DuH8xJceKM5J/NjdyyLQvSKatAr81kIKItczM05gIVE0LLL+2wgo8h0x
	 RcZzcp1iDDH6eRp7/S2+QWOrvtDcQfMli66T2nBmj6IZ6G5K3CXzaKrmwtpBpaLTGKu5n
	 2dZ3niI96rMAK9b2TjcyrsBCX1jCxnzVeGM+zkTmEAg3CkfabAXLNrZU51hXIEK5w1a6Q
	 PKxYpkLap609RczLg8USZExGHjhXjQ8LH8GrBUsnSFZzrLIsF0vT4z193TM4T3irIug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JmX8pIhr;
	arc=none smtp.remote-ip=91.218.175.164
Received: from mta0.migadu.com (out-164.mta0.migadu.com [91.218.175.164])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95A9606A323
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 07:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B95A9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JmX8pIhr
X-Envelope-To: imx@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=grnlVM8NPzNbFsIqKfom85HvWWMDds8Zcuvnsl0twCg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794899692; v=1; x=1795504492;
 b=JmX8pIhrwPheQ+nQ+Tes13ezhkwtqRBYWSivI5fv4q7gwA1VhkzZQSBm9uXr4TUs+GDuuf2G
 6M/dlwnqszO7QXpQqVjtB/8N/qk1XgBFwjDZRlEXNcnf/auCSPRoR+B1mApN+i651Jaz9lkmbXj
 bHI5mRziYCTFGPLqtDpJwraw=
X-Envelope-To: imx@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id a95767629e953e9f;
	Tue, 17 Nov 2026 07:14:52 +0000
X-Mizu-Trace-ID: a95767629e953e9f
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Tue, 17 Nov 2026 15:14:09 +0800
Subject: [PATCH 5/8] irqchip/imx-intmux: Mark input interrupts as
 level-triggered
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-imx-intmux-v1-5-189e7e0ad98d@nxp.com>
References: <20261117-imx-intmux-v1-0-189e7e0ad98d@nxp.com>
In-Reply-To: <20261117-imx-intmux-v1-0-189e7e0ad98d@nxp.com>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.3

From: Peng Fan <peng.fan@nxp.com>

The child interrupts are handled by handle_level_irq() and xlate()
advertises IRQ_TYPE_LEVEL_HIGH, but the descriptors are not marked
IRQ_LEVEL. Apart from the inconsistency, the flag feeds IRQD_LEVEL,
which makes check_irq_resend() skip replaying level interrupts.

Set IRQ_LEVEL in the map callback.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/irqchip/irq-imx-intmux.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-imx-intmux.c b/drivers/irqchip/irq-imx-intmux.c
index 31fd895f477b..ebfff621e5a9 100644
--- a/drivers/irqchip/irq-imx-intmux.c
+++ b/drivers/irqchip/irq-imx-intmux.c
@@ -124,6 +124,7 @@ static int imx_intmux_irq_map(struct irq_domain *h, unsigned int irq,
 {
 	struct intmux_irqchip_data *data = h->host_data;
 
+	irq_set_status_flags(irq, IRQ_LEVEL);
 	irq_set_chip_data(irq, data);
 	irq_set_chip_and_handler(irq, &imx_intmux_irq_chip, handle_level_irq);
 

-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795859140;
	b=CHr/UNcvxR+7alkf87jELrF37Bvu2H4DuJdUrSeVT0FBgAmdYYH4cf/S88FUsOj2ah52
	 5Qr3zxSapDVQ3AoD2lZ+Jr3vTRmhL4ZQpF6XzeYlleqzN+iNcHMLulYQQ0XwFDqtiFNgZ
	 QMbh53WaaXhN3Vz5iTCeRJU9TjrajRTmsGKSF9Z5nkW5qcSyLSufAepVR6w5/aAW1sq73
	 SAht6W4yoYopLqfL701sTTOKOZLGmkDFGFJy9sb1hwIUZ13Y27l9neXPh5KK7wRHXc00b
	 5nCgTFsNWr3QeHla2eSacG3/wRhOa2rOz8vVy1em4IEgkMkB8jX9z59oW9ZdnGOhHBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795859140;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=Fs7O+eNvSRnORnlfh+nW6WQaWDaKnXDIBeTMvJDr2Ik=;
	b=km5eDLbyhMT6MloZTmtjDdt8b20CJ4DoDJilfX+4jvPMuDpmf83tJ+r9dnOc9gUzjJMs
	 7/n8GsYGEp/+p0lUD9XK+36jEqD8TMq9dfJETW9NLbu04+Z27O0wnVGG84gWr8yQO7JUe
	 /fDIIbDnHIuMWgU9YC1Ca1aKu/pVezztJEWp2x7skijrW8XR0kdMQIKuQH94wtFWJIGF+
	 g2n8OcMDas7t9bNaMWhQkOwiWtzN1u+BAE6Yy5yar22233hydlzaAyCwQbd/9US6Lkxgp
	 /ujB1jlJ7sXUaRP/flvbMa7H8svIYlvUhoR004ERPak6hYv426x85NoFyQidXTb/scQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=gZjZ9faR;
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444D6606A31C
	for <imx@lists.linux.dev>; Sat, 28 Nov 2026 09:45:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 444D6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=gZjZ9faR
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655b0882;
	Sat, 28 Nov 2026 17:45:35 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: abelvesa@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	m202171776@hust.edu.cn,
	peng.fan@nxp.com,
	dzm91@hust.edu.cn,
	lyx2022@hust.edu.cn,
	zero12113@hust.edu.cn,
	mr.bossman075@gmail.com
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] clk: imx: Manage OF clock provider lifetimes
Date: Sat, 28 Nov 2026 17:45:34 +0800
Message-ID: <20261128-f81b700d6c-u08-0@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
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
X-HM-Tid: 0aa2218bba9c03a1kunmf5913c094520b8
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSEtOVk1DGEMYTElMQx8dGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=gZjZ9faR9SR3yMhZ9o+qYHpO6PHRjODg8jF6LlU6VPed+GNNstr8SbKKn3IEFYjlK1JPYd/FK8wG0n7BshZBmX9ceRsl1XplkJVRoT2EmDWFWtDyQXeq2TZ97xPUY8Q10zhPKpd6rqlDwdzVbCKKC0Bu7GUIbnkt8kTPRwVn+1w=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=Fs7O+eNvSRnORnlfh+nW6WQaWDaKnXDIBeTMvJDr2Ik=;
	h=date:mime-version:subject:message-id:from;

Pair provider registration with teardown in the i.MX8M, i.MX93 and i.MX
RT1050 clock drivers.

Guangshuo Li (2):
  clk: imx: Manage the OF clock providers for i.MX8M and i.MX93
  clk: imxrt1050: Fix potential use-after-free on unbind

base-commit: d8f05ec001e838cdb94fc14efa7c411e676f9ab9

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924817;
	b=DmaDuq+ILPlhfvAfwWxmBA/Qzjn1zeZ9lfMUAhmnBB4Ynu7MmkTnfC7PnljdOhXYDZ4J
	 rB1VnyJr6gLjhOQTbomSP/s33D+kaXPCTOH4DCTxu+NLzjwDGD1avY1w+s1wbXeyldoOW
	 jwooHo61yfyiGXBfEogls5xkJEFGvOydnMu4yCFyNmtrNzo4CBxshJfzIe8+haHJN8xFS
	 iGmiTq3n8BVfuAMEqrb4SZRgJq/ayfYvD6Fy3WR1YDmSN38qoI9EwyIoGlRWaPl2O0JWS
	 rQkjmBgh/MzeP6xpFcwCU/BRM9KgvEvI6CHy9NPawVUPoRsnpHTMt5b7J5oj8eD80Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924817;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=XnDg3LSvvLKOhODP50y+bXUFTm0xPYEfsjQv/OxLyvY=;
	b=oegTB8rosVGT4XjPMPm5qlHZ8TKqcLv7xSG7929L+DuuLIK+syPPRC+AP1VER+eaNJKz
	 vv37im0MxNSueFXPXmirfBoeIUvfEgJBST99ucPTZG9yb/KX1JX1SHxHOr0/5utml6bRj
	 TL8urOZjH0ohVTOZoPsLEsR5QXocRthe21ehSZzc3iZtKew1btxObTdTHLM8t0sKH05Wv
	 yzzNADrkDlv6jyG1w+n8DVqcSbAkPhBd1E3ldaU+soj0j8Bju0S/fzzc3n4zZXiG4kSe/
	 hbxQgSDhUqO/VMcx0IbgJWyWdjapBE/dPlK25yGgta1kjX4UX2B+iePa/RQR02V5IJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=T8RtQEgD;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDE7606BD36
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 14:13:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FDE7606BD36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=T8RtQEgD
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 063A41A167C;
	Tue, 17 Nov 2026 14:13:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C4FE45FC81;
	Tue, 17 Nov 2026 14:13:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C008411BC0024;
	Tue, 17 Nov 2026 15:13:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794924813; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XnDg3LSvvLKOhODP50y+bXUFTm0xPYEfsjQv/OxLyvY=;
	b=T8RtQEgDk82tB+T2G8WcDM83qbuxQWJx50BVnv5ZQSuXl8L3T+hASktHtCiSVsWRwsRvne
	08/HM2XY+9JfRhDzrK4adoxW/gZ2cOcEg5ycMusHDq62o1vSWPPkMevMd+H6PzgV09rbqo
	Wv1vzevpnUlPkR9m8wjg6K8ac6TPgzAQrRhY+GCDAie0a03yg9L29AbsFSIj+h8yv0VtYH
	hThFiJGiXDewVXgYOPX7+SoinmumDzsWHRk8zTmP0aBNWvOjcmk5o1S25Vtj9yvRSEV3Ac
	TIkIjlLdLXWTYCwQ7gm/DZG2g9tIEspLPORS9mwLwOG8P6eo9MOlcytVEnU/kQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank.Li@oss.nxp.com
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Frank Li <Frank.Li@nxp.com>,  Alok Tiwari
 <alok.a.tiwari@oracle.com>,  Runyu Xiao <runyu.xiao@seu.edu.cn>,  Chen Ni
 <nichen@iscas.ac.cn>,  Kees Cook <kees+treewide@kernel.org>,  Hemanth
 Selam <hemanth.selam@gmail.com>,  linux-mtd@lists.infradead.org (open
 list:CADENCE NAND DRIVER),  linux-kernel@vger.kernel.org (open list),
  imx@lists.linux.dev
Subject: Re: [PATCH 1/1] mtd: nand: raw: use dmaengine accessor API functions
In-Reply-To: <20261111202502.3860647-1-Frank.Li@oss.nxp.com> (Frank Li's
	message of "Wed, 11 Nov 2026 15:24:45 -0500")
References: <20261111202502.3860647-1-Frank.Li@oss.nxp.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 17 Nov 2026 15:13:25 +0100
Message-ID: <87bj7nlf5m.fsf@bootlin.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 11/11/2026 at 15:24:45 -05, Frank.Li@oss.nxp.com wrote:

> From: Frank Li <Frank.Li@nxp.com>
>
> Use dmaengine_get_dma_device() instead of directly accessing chan->device
> and use dmaengine_prep_dma_memcpy() instead of calling the function point=
er
> directly. This follows the dmaengine API convention of using accessor
> helpers to decouple drivers from internal dmaengine structures.
>
> Affects cadence-nand-controller and fsmc_nand drivers.
>
> No functional change and prepare to move struct dma_device to private.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

I will fix the subject when applying (nand: raw: -> rawnand:)

Thanks,
Miqu=C3=A8l

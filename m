Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792545;
	b=Lyv9qNp2P0/lysNshb/6WfS9BuVOXmWNAF6GPf9xVZn6xeefyAN6oyTKYQUJ9vZglR5K
	 /2UB424B4CtpSkdNIh4kXo1NRETF/CuLBffSOtlvv3Ho3CfOMUmfoMfba2D2fd90mVKod
	 tyA5z8H1fdrQTUSFGkFWVybbk+COMEfEmynUdLMCKawTHAH4g2e4gw+abNii5m5DWYfd+
	 WxQgC8e1Zy9VrMdlOsEZGIcJYZaspfbtBWHS4jCj3vkc9G+0mgTr93m/w+wtyP6QOtJpT
	 6+7sSExaGcYMwO+S6e978218nqT6oqF0oKv7p3x4QjjYVMT9OQOkP1RHI7azdMX7A/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792545;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=K/F58fTzeymXPtAhbnqmB/CVuNXYDU2P7HmmINGKBoo=;
	b=shToHzKLyxlWpwnfiM9WCC1f7VEwzDkL/Bj//DPvH1EHhAIB6hpg9Q7Iin3F8boLGrEm
	 CFGaC7RniNYa4IxOF6h2oEFF+H48HDxTVQ3BavO0WyGPs9wUlErCkBHhTwUlcDqqJhrW2
	 VvyC4wsvAXwpMrvgGyxl0BOkGRTwMgvhiHW9MCp8hh/blqHVonH+RvKOtj3eLTrZAELV1
	 mG8K67/o+nOuekIyOlNQE9ERIBC+V2bUuty7jGmIoDf8mVPCPDr29z4IX3Yoy7rmhkIXS
	 S2+4w0RmK8eDhQnaptMjjehW0p1E37XfDoyRP7RFn0cjtihLKV2N+yZYjJg0gngS23A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=YITMaOzE;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6D5606A32A
	for <imx@lists.linux.dev>; Fri, 27 Nov 2026 15:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB6D5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=YITMaOzE
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 32A0D1A181E;
	Fri, 27 Nov 2026 15:15:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E81C86049C;
	Fri, 27 Nov 2026 15:15:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 83EF011E90B55;
	Fri, 27 Nov 2026 16:15:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795792537; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=K/F58fTzeymXPtAhbnqmB/CVuNXYDU2P7HmmINGKBoo=;
	b=YITMaOzEHoFT8Vw3PeTkE4bw3pS1fynbk/EHTRHYCmd2eGK6trTuao71I+BwgclPKtBf2o
	sXhYc+lTt7gkgm0WPbFiSBV3G0Yi0tjt3He5CnRIZzNZmZyaI81slENa8dMNr2AjL5nevD
	C8NRIjLqsiFuBtaDTZxyYTIIu9YQObpVyxiT3YZKPkrVOI5YZDW5mB9CjxsCTITBcTKuz9
	zj62EQanPs5MxrFTpq6InG1/a7X+xnrI936IdtvhfeYKAi6uyRM43waRUE/mI9BMw+KnMv
	j9epb+hFf8w3sljp/duVbQHoFU6i/rULR5AuoYFV6VTl55jUK/wRkxaJBsgJ7Q==
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 16:15:28 +0100
Message-Id: <DN63BMGBI07A.1IC73REGZ7NXZ@bootlin.com>
Subject: Re: [PATCH v13 0/5] Add support for i.MX94 DCIF
Cc: <linux-clk@vger.kernel.org>, <imx@lists.linux.dev>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
To: "Laurentiu Palcu" <laurentiu.palcu@oss.nxp.com>, "Abel Vesa"
 <abelvesa@kernel.org>, "Peng Fan" <peng.fan@nxp.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Brian Masney" <bmasney+clk@redhat.com>, "Jerome
 Brunet" <jbrunet+clk@baylibre.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20261120-dcif-upstreaming-v13-0-966ac248773f@oss.nxp.com>
 <awmGCp4e2pgtxsqr@vm>
In-Reply-To: <awmGCp4e2pgtxsqr@vm>
X-Last-TLS-Session-Version: TLSv1.3

On Fri Nov 27, 2026 at 2:41 PM CET, Laurentiu Palcu wrote:
> Hi Luca, Frank,
>
> All patches in v13 now have review tags. Since we are approaching -rc6,
> would it be possible to pick this up for 7.5?
>
> Luca: could you apply 1/5 and 2/5 to drm-misc-next?

I plan to apply these next week. I ususally leave at least 1w after a patch
is reviewed before applying it, in case someone has objections.

> Frank: could 3/5-5/5 go through i.MX tree?

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB3047ACE3
	for <imx@lists.linux.dev>; Thu,  8 Oct 2026 09:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450073; cv=none; b=Vg5H2rYMuitj6UeKmsFp3uU9S2OJMM5vNjR4evBUvid/NMCP/OaHUeLhwCF8u4UtA2UtzJL17KUKmtFsbh/C7QprqHZ98IgNiSHE87wcPCKBreiWT1Dd6TpB9o2k66rxunvgVCzwmdWrbrxfa5nZguTRAabmHwKP8MpM8KbsAME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450073; c=relaxed/simple;
	bh=4F03o97iXSlmGOeJsrP5FuGxw5vNoZtKjrawKFd6mQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GoXQ3SvEtYT/tjndVAHp1eNPMxmIEcsHTDYzFASKRHt3sZAATOviyQ2qjtTp0FfWInrbQgevFZEKn2AtW+scetSOXLEZ8U/SpGDUif2C7jlBVtJzyT4+ZoDRy29IDluaXM4YO/Mj+kcwuoslZK1OWI7yJmPPlACMlUjxpda30ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=rZDzBkfR; arc=none smtp.client-ip=212.27.42.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="rZDzBkfR"
Received: from L30177.local (unknown [213.36.7.12])
	(Authenticated sender: vjardin@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 3FEF4780502;
	Thu,  8 Oct 2026 11:00:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1791450064;
	bh=4F03o97iXSlmGOeJsrP5FuGxw5vNoZtKjrawKFd6mQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rZDzBkfRvSyiwKF5K42MielqdUUkE1C2gmHhhap35L/GORwrBU2l71Xl8FTU2RGdE
	 Zj4F/Q/xipQZ1CBnDytQM9ZnADLjNyuQxy16WuOTThMKR8ayJcFO7sDTsCnb+KgVlk
	 ZLYAuBiH+n7rV6id6vSfZ/JcIMK9I+LgNm6GuPNu91HGEhQlXjUMn7mAHqzolO6EcQ
	 wyJPf/EJfAxyuLPq4E6D46uTMc4QJFxsR22UOvN/RFESwJigwvSVSfwwdxhvqB9/R2
	 oT9Qlwqy9rW0uNGStUl+kUFDJw4dpp8hHvh5k6g0xyIvoAFsqAi+1qHuPz0RW0C4tk
	 rAc/VxzUeXXNA==
Date: Thu, 8 Oct 2026 11:00:48 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Carlos Song <carlos.song@oss.nxp.com>
Cc: Haobin Jiang <lemonoutput@foxmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Carlos Song <carlos.song@nxp.com>, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: imx: add I2C_M_REV_DIR_ADDR and I2C_M_NOSTART
Message-ID: <asdbv4ZWwJ72ObNn@L30177.local>
References: <20260812-for-upstream-i2c-imx-lx2160-reverse-v2-1-f1343714c5a9@free.fr>
 <apcYp0Zc7CrJMiOh@lizhi-Precision-Tower-5810>
 <aqO9SMvI89rqoEGb@L23803.iliad.fr>
 <arMUxCW5ZTzLT3VN@L30177.local>
 <arw0mVbacAXv_1H7@L30177.local>
 <asaElUqBu5ht6amB@L30177.local>
 <c72e3cfa-26f3-4557-858a-2a919bf68986@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c72e3cfa-26f3-4557-858a-2a919bf68986@oss.nxp.com>

Hi Carlos,

> This patch is a new feature, so I think it will be merged until v7.4 at
> least.

ok, understood. I'll wait and if needed a I can/will resend
an updated patch based on a rebased with v7.4

best regards,
  Vincent

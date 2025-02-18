Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D55822FAE1
	for <imx@lists.linux.dev>; Tue, 18 Feb 2025 09:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739870611; cv=none; b=RU0zvQYFQo4dDGyjswSeY4LLc2ewPMhMRIor562bz4jRC0JS96AqLEXRVr/AHVu09S70NGVnqhSP1bRJ+MtpS1TbJOhfcnxZc62eC475A2f+BplHSpKwrTKsgYj/hq5wJ3MQKQ2md5hTL6rG8atVvpv7WJ/mXuP3DnIAWoUxkek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739870611; c=relaxed/simple;
	bh=KPymWalzJF0940XaRvRQX+ZY9ifYmd3AMJoWGB24zsI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d9/ejDaZErljJBww6dqMVXjQSlMW9onuS3DxlGIQ/yc6HNKgUcHupgHckKzyF2vjAwv4LCJNlRBaiexljK6ql0JommrwzvTJwvMyr/DZSaL+qVXAlk0OYMDaY5SzBB7wZCIgMd1mHWkd+uWQq8KB8fRCREAvTZ+Rmm4NeeuHNn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tkJp9-0000w2-0A; Tue, 18 Feb 2025 10:23:27 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tkJp8-001YuI-2P;
	Tue, 18 Feb 2025 10:23:26 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tkJp8-0003Hv-28;
	Tue, 18 Feb 2025 10:23:26 +0100
Message-ID: <9e741688bb5d246ccba557ab22e0682029f32809.camel@pengutronix.de>
Subject: Re: [PATCH 1/5] reset: imx8mp-audiomix: Add prefix for internal
 macro
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Daniel Baluta <daniel.baluta@nxp.com>, shawnguo@kernel.org, 
	mathieu.poirier@linaro.org
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, andersson@kernel.org, 
	linux-remoteproc@vger.kernel.org, iuliana.prodan@nxp.com, 
	laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com, Frank.Li@nxp.com, 
	krzk@kernel.org
Date: Tue, 18 Feb 2025 10:23:26 +0100
In-Reply-To: <20250218085712.66690-2-daniel.baluta@nxp.com>
References: <20250218085712.66690-1-daniel.baluta@nxp.com>
	 <20250218085712.66690-2-daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On Di, 2025-02-18 at 10:57 +0200, Daniel Baluta wrote:
> This adds IMX8MP_AUDIOMIX_ prefix to internal macros
> in order to show that specific macros are related to
> audiomix.
>=20
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

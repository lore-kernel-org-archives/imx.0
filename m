Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDBB14E2E8
	for <imx@lists.linux.dev>; Fri, 20 Sep 2024 12:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726833773; cv=none; b=tXEZjYVmt7O06ESNt7QdzSlk+J6W9JdqwVsHLo4+wV1Z1qU/580l+nZUBIIeS5QfzBAe3TA0HeK8cNR5zJzQwM8s/dJq4JcZ55Hs3fwWPSfZohFu30pSCs4dvIMcCB1GH2hfrsEv090dgT80tmbc85hzqZktg/sULpOtl1IVooE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726833773; c=relaxed/simple;
	bh=MLHx3Gi4RClFOYYxLobeZr9bwE8N23lWkMqwLS2hJWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QZWXJilU8onTn4yOoKC9rNc9MDJM2tBdKoCXw1zd5evs9oIrqAV1PzHoocoSmE2qeGuJ/quHJYDTAzA+THbN3UiIiDwEiKQJsO5kTXpC6N4Bm/wx9IyGZAs4fdfOpYJ21yxufiMgQmwwycDDaS8/Ef1ss1P8vTMFQOEl0z7jYXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1srcLA-0000yX-UX; Fri, 20 Sep 2024 14:02:24 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sha@pengutronix.de>)
	id 1srcLA-000FEL-7y; Fri, 20 Sep 2024 14:02:24 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1srcLA-001tQr-0T;
	Fri, 20 Sep 2024 14:02:24 +0200
Date: Fri, 20 Sep 2024 14:02:24 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [EXT] Re: [PATCH v7 4/5] firmware: imx: add driver for NXP
 EdgeLock Enclave
Message-ID: <Zu1kUDb5dfB5dRbe@pengutronix.de>
References: <20240904-imx-se-if-v7-0-5afd2ab74264@nxp.com>
 <20240904-imx-se-if-v7-4-5afd2ab74264@nxp.com>
 <Zt7n0AxGEw-ZXbui@pengutronix.de>
 <AS8PR04MB85932B4E47EFC519B0EF6D9A95632@AS8PR04MB8593.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR04MB85932B4E47EFC519B0EF6D9A95632@AS8PR04MB8593.eurprd04.prod.outlook.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hi Pankaj,

On Thu, Sep 19, 2024 at 06:43:45AM +0000, Pankaj Gupta wrote:
> > +static void se_load_firmware(const struct firmware *fw, void 
> > +*context) {
> > +     struct se_if_priv *priv = context;
> > +     const struct se_if_node_info *info = priv->info;
> > +     phys_addr_t se_fw_phyaddr;
> > +     u8 *se_fw_buf;
> > +     int ret;
> > +
> > +     if (!fw) {
> > +             if (priv->fw_fail > MAX_FW_LOAD_RETRIES)
> > +                     dev_dbg(priv->dev,
> > +                              "External FW not found, using ROM FW.\n");
> > +             else {
> > +                     /*add a bit delay to wait for firmware priv released
> */
> > +                     msleep(20);
> > +
> > +                     /* Load firmware one more time if timeout */
> > +                     request_firmware_nowait(THIS_MODULE,
> > +                                     FW_ACTION_UEVENT,
> priv->se_img_file_to_load,
> > +                                     priv->dev, GFP_KERNEL, priv,
> > +                                     se_load_firmware);
> > +                     priv->fw_fail++;
> > +                     dev_dbg(priv->dev, "Value of retries = 0x%x.\n",
> > +                             priv->fw_fail);
> > +             }
> > +
> > +             return;
> > +     }
> 
> > Are you continuously trying to load the firmware here in the hope that the
> rootfs is mounted before your retry counter exceeds?
> 
> Yes.
> 
> > Don't do this.
> 
> Shall the retry counter to be removed, to make it predictable?
> Or am I missing something.

Either compile the firmware into the kernel or the ELE driver as module.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

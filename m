Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8A822ACF1
	for <imx@lists.linux.dev>; Thu,  6 Feb 2025 11:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738842573; cv=none; b=txD04rtmK0oJpdrWJVjYqHPCc/px4zfQXK6IZ1rK+xmQIH907CadIJT1Vp2SStZw9JCSBKmDo0OaEfwXteWNOS3MfLWDeZQvFBMRdTKVqmN7cLDT8q+ir1ScYD5GHWfC+9fsg7fgDH1He3k4J7AXjVktriHRzco3rxgTHI9nzDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738842573; c=relaxed/simple;
	bh=E8+d7rzKIQYxvCPsaoYc55cIInzpgJbkEM+e7bop0Aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FDp7VGp6zUsjTbl7S2q6E8X3J2LtiKhmQHneberhGXRPTi3ZktpSIMU0oruyx3Z6ko0WUO1Z/InZbHcdTqkOmTnGxkSFHYTp5cFBnZe4lvIwsGGX3yJcyw9xBh92MAZy+aggun/SnT0rDVXMs0DRPtjVy6fQnAcVDtGT/r8k7/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rmufASzP; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rmufASzP"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-436345cc17bso5603075e9.0
        for <imx@lists.linux.dev>; Thu, 06 Feb 2025 03:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738842568; x=1739447368; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NX9ms/4I8NC6zrc1aMCv7TAeR5qd6HJ58Z3muKUA91A=;
        b=rmufASzPD+TFw7t2TFtm88++qt0Wt+gwViLWo1QD41BMlyrj7qVGA84WEvHTh81TI9
         jCe4cXUWgDL2yCszTwk9EVRSNfyoWcuyPYD496GmtEimSTTx6iB+FOtffYSUuC4GJJwE
         VFaINtJo6XAzXPjjsMJ/GNhA4yFf/Ie5+IskaTLTpllZmZzNoAQCfQPwXD2iAMcTHaA6
         5b9InwtMo2keC5ENwGi4ra7KKYWN+hAar3Lv+fGi+Rt5uTziqqx2w9vHe3kuE9Ux5cUh
         CmzQYWE/ja+iV4dj9h0kugipbSninD930NN9ZJxx2HwpzjL/WZU+hWgPOo4lJabJa+B3
         RBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738842568; x=1739447368;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NX9ms/4I8NC6zrc1aMCv7TAeR5qd6HJ58Z3muKUA91A=;
        b=F4UP3/qQDRseeX5W1Q6AFr3CVYSDXiXz9cg3Ofu9e9icDyxFzWEiyVYbJJFrApPiCs
         8IraSHBuJIJV2SJgOjXSf6g5NlZz8mXcVodFlDoRfojdwnldHzUjnL6Yvq/Irj3zkuqJ
         WF/IT+vr8u/6rOSsLhN2n1RlveYlZvDb13+rFjLwFF7AtAppvQVKqxrL/5Deg+jTo7Yr
         GRQYQHyJqVAIdO/4T6MJBNlWSIenGJmGEFsVNxLE7MtxnFtmleOdJPWUp5iMhuJvAjGk
         38iGexbDLCp4gRTVKdqhTpTRL5j5beBEE+TkqwBu79nLOa+9QngsUaW1F7FqV30KncL/
         ZfVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeSZ0Cx10GDupYWpZslGJEMfuwsp/uIp2pTaIJm9hYa+JJinEm/Qwf+NB+HDYtqkHNNs4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxjrKA0EFqDBC73OW1bc5VXnRvraZkK5NLRWQnymKud0/IYBCaI
	cLiIdcn9+agGAbHa1leIpzseXSfttvUTXnzqzBrKbQH9l2C1xOf27Z/dCbqJJsg=
X-Gm-Gg: ASbGncuN0Hex0WRWrQ9Fe/Zla7hIFeIEo14sXs1oIo9W2Npgn79WVKZsK/JcMzeqc+q
	rwxqRKUW3oEg3TzR45sSfg8hZPEJyAUAIspWtHpYFl9+Q/7PZqyOXmhUMy3IaCtg6LiZYyp9PA7
	3N9Foe8MeG8VP2DUQgKMKsN67D5/pv3dX/Yfkk9N+gi73I6pOML+O5weKh5seOw4PLfMJSkmQ1n
	lx7OH3AF3u45elEbCm3UjGged/qjta4C+xMR53OPjUBsEUIFGktVuqdM7yte8fUABciyiNcWkhP
	RkliZCJ9kxxJeuyOfk9C
X-Google-Smtp-Source: AGHT+IGBjV9LowhqFquW+OEjP5fmaVEQ40WZqgqqY5aomaJpQL2ZwcJcaosKDFlLLto2p8sEGWzZkQ==
X-Received: by 2002:a05:600c:46d4:b0:434:f767:68ea with SMTP id 5b1f17b1804b1-4390d42ccb9mr56959955e9.5.1738842568525;
        Thu, 06 Feb 2025 03:49:28 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4390d94d685sm52793145e9.13.2025.02.06.03.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 03:49:28 -0800 (PST)
Date: Thu, 6 Feb 2025 14:49:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Sudeep Holla <sudeep.holla@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 1/4] firmware: arm_scmi: Bypass setting fwnode for
 scmi cpufreq
Message-ID: <1a420172-de2f-4602-a181-be79bff0bb2b@stanley.mountain>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-1-3af2fa37dbac@nxp.com>
 <7a29ec8f-fef8-4f1c-a2eb-16a63f2b820c@stanley.mountain>
 <20250206105218.GA22527@localhost.localdomain>
 <e20415aa-517c-4e72-a1c3-9c02769c1149@stanley.mountain>
 <Z6SgFGb4Z88v783c@pluto>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6SgFGb4Z88v783c@pluto>

On Thu, Feb 06, 2025 at 11:42:12AM +0000, Cristian Marussi wrote:
> On Thu, Feb 06, 2025 at 02:31:19PM +0300, Dan Carpenter wrote:
> > On Thu, Feb 06, 2025 at 06:52:20PM +0800, Peng Fan wrote:
> > > On Wed, Feb 05, 2025 at 03:45:00PM +0300, Dan Carpenter wrote:
> > > >On Mon, Jan 20, 2025 at 03:13:29PM +0800, Peng Fan (OSS) wrote:
> > > >> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> > > >> index 2c853c84b58f530898057e4ab274ba76070de05e..7850eb7710f499888d32aebf5d99df63db8bfa26 100644
> > > >> --- a/drivers/firmware/arm_scmi/bus.c
> > > >> +++ b/drivers/firmware/arm_scmi/bus.c
> > > >> @@ -344,6 +344,21 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
> > > >>  	device_unregister(&scmi_dev->dev);
> > > >>  }
> > > >>  
> > > >> +static int
> > > >> +__scmi_device_set_node(struct scmi_device *scmi_dev, struct device_node *np,
> > > >> +		       int protocol, const char *name)
> > > >> +{
> > > >> +	/* cpufreq device does not need to be supplier from devlink perspective */
> > > >> +	if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufreq")) {
> > > >
> > > >I don't love this...  It seems like an hack.  Could we put a flag
> > > >somewhere instead?  Perhaps in scmi_device?  (I'm just saying that
> > > >because that's what we're passing to this function).
> > > 
> > > This means when creating scmi_device, a flag needs to be set which requires
> > > to extend scmi_device_id to include a flag entry or else.
> > > 
> > > As below in scmi-cpufreq.c
> > > { SCMI_PROTOCOL_PERF, "cpufreq", SCMI_FWNODE_NO }
> > > 
> > 
> > Yeah, I like that.
> > 
> > -	if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufreq")) {
> > +	if (scmi_dev->flags & SCMI_FWNODE_NO) {
> > 
> > Or we could do something like "if (scmi_dev->no_fwnode) {"
> 
> I proposed a flag a few review ago about this, it shoule come somehow
> from the device_table above like Peng was proposing, so that a driver
> can just declare that does NOT need fw_devlink.

Great.  I think we're on the same page then.

regards,
dan carpenter

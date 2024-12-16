Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA4B53E23
	for <imx@lists.linux.dev>; Mon, 16 Dec 2024 17:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734369294; cv=none; b=BqfTIfEfnMmGB9EubaiyJyPrgPAkCMM5BEuuOPY6wnXYtG9XKXUEdWTIYRgDZXhfKUtvpkmTXyEKq22T8KIwZLKAuEWeZXv39BBhMiu1u9rcf2CQYWnpbx6JpTJAdU2vABcGq9JpXc22oOOLnG51lR4iqNdyVvO+KtDg3azPg+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734369294; c=relaxed/simple;
	bh=zn3zIjBvSwRghREDup/xO5OCc4OaGObSpmbwEn0SNaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BDYWPx167Lb3wNPSn+vQq3IBGQ5kXQQB9sncAAetiLiYijka9FwfYdt35Ym1h/Cref7otvHsTnqEFs8/Yx6h8h7gXfTqQv8E3FT8exuGWgHggD5sWNl+1t6a/90JOwB2lLH3reifM/qp/7mYnRxGed2h1xOwesuBgug8K1Rw8tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/9XEsR/; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/9XEsR/"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7fbc65f6c72so3885015a12.1
        for <imx@lists.linux.dev>; Mon, 16 Dec 2024 09:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734369292; x=1734974092; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lRSt1oLHA0zTODMJmMWpU6xidSXKF2EyOx2XJ0WYI9g=;
        b=W/9XEsR/CqdepzpLOooTlfWI+DlNT3eD2G8Ek0xzf8a+83/26q9ytLetWXnDv3TAQt
         qf36lzwRpJZPDT4o2NxIa9Cq5DJETuQQ7kuFcqMlGp1LhpsGG6iZ9RCuGplWJWNzkhpv
         g1DjuF5KgD+gN+/GDEQ77Are2emWKg2xP/nQjuz44MZuOur1B9IK80aM/iJDj8FvdJsr
         fDpEobOgLR9UF2wZ3OW9uF0kSKlbof5/IVH5EdYm7wZPJqK8tv7b+HdQ54jNmoop19+/
         ZYaITgu0nV+K9YzTQeZTXf1DEIz8Bz1XjSKWGG7STqmDLY96fdKUiDL8kWHKBrcVdvs+
         A/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734369292; x=1734974092;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lRSt1oLHA0zTODMJmMWpU6xidSXKF2EyOx2XJ0WYI9g=;
        b=Fd2CArQn8brayJ0fjS50bJ/K7AhRGnhqvHe5xL1pIbsMw6NdxkYQ2t6WAV3tTrf9U4
         LTNnGK756eVxrg9jv0SswG6p7lT72n5T+Vagn/jlHgMXR+8zuTkxOdcrmNCmNB3z6iHr
         8feGAYVAG4N/w7BfU2qxUdIhHvycpraN92j+uAUIJ+IS6t/hDwd6vt0pmFWgK6t5o+8s
         CV7DkAT9tRr4g0lb07anj0R3LV9To2+2a9RAqnhkZWLX45n7hzYqEyTvUaAyDrbUh1PV
         eS9jSseG4akgh7+5F3VS1GqY8nEaDzP8RdhBClxqASAvzNwBLBWWzqe7RSy8U+IDI23r
         iinA==
X-Forwarded-Encrypted: i=1; AJvYcCWF1eInj5tEt1MV96YoLv7WsZ2gvMEXCbN5C/6cQMVEf866e5EzhdKff2hp1MxMebLuM8A=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5kwbtaJMIRcqUl7pVx691FaOFaHC5RJwTdcgsSApzcZJH4KVX
	11Z9kXGHaXMsdGV6GXtzESOmJwwX01Ukzjs2kmsr3q4hwr/CgbY6
X-Gm-Gg: ASbGncuz1WD/TSJfigdGuS6WLrdh30yCrQJqq0udXv8sA17AMz4F1paIzHCX9ihyOOL
	GBjG7nvVrJGN5Orx5GRMZrIA1WJgxYxNXbzqzlWZfOwglYiTNYW0zkWjUJid1VTKRoNzTrKYjpx
	/fnxQTE6wFastGGCVFdL36mOv2ie7yBfiS34febOv0z8R7hfykatQz/RB2elcc5QQ+ePNhpsUGM
	hHzEjPG26JRdd9xE895X3WMtwLYlI92d+7No7ntH3QyA+jn9EMJFnY4sA==
X-Google-Smtp-Source: AGHT+IGV0uc9TXAotb6SVuWf7nwmp5/mTbhYXT4dFXmqRcyoiJbbZ7KHFY3NKQN1g7dRKFUEA+vrxQ==
X-Received: by 2002:a17:90b:3e88:b0:2ea:5054:6c49 with SMTP id 98e67ed59e1d1-2f28f8691ebmr22339295a91.0.1734369291762;
        Mon, 16 Dec 2024 09:14:51 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:e6c1:cee8:7b58:a395])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2a24349b5sm4963932a91.40.2024.12.16.09.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 09:14:51 -0800 (PST)
Date: Mon, 16 Dec 2024 09:14:48 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Luwei Zhou <b45643@freescale.com>,
	Vipul Kumar <vipul_kumar@mentor.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] input: mma8450: Add chip ID check in probe
Message-ID: <Z2BgCC8hPyaAxhOL@google.com>
References: <20241213222310.189443-1-Frank.Li@nxp.com>
 <bzzzezoon5u5pufpbkn3fnm2dtbrzatx4w4tbdstcdmowvfzzn@cplbmxtgmu6z>
 <Z2BVlyV8o1dkBUq2@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z2BVlyV8o1dkBUq2@lizhi-Precision-Tower-5810>

On Mon, Dec 16, 2024 at 11:30:15AM -0500, Frank Li wrote:
> On Sat, Dec 14, 2024 at 12:02:56AM +0100, Uwe Kleine-König wrote:
> > Hello Frank,
> >
> > On Fri, Dec 13, 2024 at 05:23:09PM -0500, Frank Li wrote:
> > > From: Luwei Zhou <b45643@freescale.com>
> > >
> > > Prevent continuous polling error logs by adding a chip ID check in the
> > > probe  function. This ensures the driver only proceeds when the mma8450 is
> > > present, avoiding issues in scenarios like missing add-on cards.
> > >
> > > Signed-off-by: Luwei Zhou <b45643@freescale.com>
> > > Signed-off-by: Fugang Duan <B38611@freescale.com>
> > > Signed-off-by: Vipul Kumar <vipul_kumar@mentor.com>
> > > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  drivers/input/misc/mma8450.c | 16 +++++++++++++++-
> > >  1 file changed, 15 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/input/misc/mma8450.c b/drivers/input/misc/mma8450.c
> > > index 08412239b8e69..da941748ed29b 100644
> > > --- a/drivers/input/misc/mma8450.c
> > > +++ b/drivers/input/misc/mma8450.c
> > > @@ -38,6 +38,8 @@
> > >
> > >  #define MMA8450_CTRL_REG1	0x38
> > >  #define MMA8450_CTRL_REG2	0x39
> > > +#define MMA8450_ID		0xc6
> > > +#define MMA8450_WHO_AM_I	0x0f
> > >
> > >  static int mma8450_read(struct i2c_client *c, unsigned int off)
> > >  {
> > > @@ -148,8 +150,20 @@ static void mma8450_close(struct input_dev *input)
> > >   */
> > >  static int mma8450_probe(struct i2c_client *c)
> > >  {
> > > +	struct i2c_adapter *adapter = to_i2c_adapter(c->dev.parent);
> >
> > +	struct i2c_adapter *adapter = c->adapter;
> >
> > >  	struct input_dev *input;
> > > -	int err;
> > > +	int err, client_id;
> > > +
> > > +	err = i2c_check_functionality(adapter,
> > > +				      I2C_FUNC_SMBUS_BYTE | I2C_FUNC_SMBUS_BYTE_DATA);
> > > +	if (!err)
> > > +		return err;
> >
> > How unusual. I would have expected no ! here.
> 
> yes, it should be better
> 
> 	if (!i2c_check_functionality())
> 		....
> 
> i2c_check_functionality() return 1 if adapter supports everything we need.

Yes, it would be much better, otherwise in the case when an adapter does
not support the required functionality your code returns 0 which signals
successful probing.

Thanks.

-- 
Dmitry

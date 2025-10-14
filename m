Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9983C30C351
	for <imx@lists.linux.dev>; Tue, 14 Oct 2025 11:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760441158; cv=none; b=unKtO+baKykKcWGBgMHGHL9DBFc4zU/uiekrhRgWo9HJLDsMoZasdnKNjVagGGcqqWL8nCT+coX5186ac1c9080xS9GuGnoUvKFAMTrSx3PI3nppKZgyuXJiGp3F6aw4U2bANzY1Qce032vE6r/u9IlZLIsRf3wR2UxEr6ciLkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760441158; c=relaxed/simple;
	bh=iQmTbrHUexc232Nhf3QX3VZFHuse7k+IcjM2fAe1ig4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=us+UAVgkQWLmwUmX3ABCXfcSZKGlSKLlnD2mdACNeaqUbhGlbdCsYu6wShvjM3dHr7ZqjGxHXKNwBRY7UVusPREer1KgYYdvOZFEqZwQqOEVj+//WVPAqXcmkwv2QWrxV8tMpJ3IoxbL9tnL38/csRj/n/uKSvJa69qZpp6pqIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NwfIMGG3; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwfIMGG3"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4257aafab98so4412391f8f.3
        for <imx@lists.linux.dev>; Tue, 14 Oct 2025 04:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760441155; x=1761045955; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uiSHBqGlXIEAZvcjTP0Y/hDCrVSuK2ils+FnYn9ERgY=;
        b=NwfIMGG3KyhvL1IbWw9Ja6fhKoX26+Xn3x9/WObSR7ehK4ArIMbDMYui3a49I6Is77
         yVsbbfMggCiCV3jOVjmj9GzyeBTr2/2dYD0Lsh5+P/HHJYkw3BavlnpGnYp5dY3+IrLV
         0vDIcn6b8MR0DuCf/Jix/BY1Thbb5BlMiqVhrTIbA4bt6rPj+/4Jp1Zbua8OnALFS6SZ
         WWotxiLEoQFgPmjk/qoXYNPYq9lVUZUXuZUWGAouKlsXZHFkTKU/jNuptfKK2QSeEONF
         QHCFFH8FJOJd6Tp9sQ0knGTOsrx9CwuKNTD0jl3s9t68oQN7R6u7ZNbUIFjlkce98stB
         5yXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760441155; x=1761045955;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uiSHBqGlXIEAZvcjTP0Y/hDCrVSuK2ils+FnYn9ERgY=;
        b=xUif9u65tWoPHRXFTjXTUtdfhzgB6IYWI/U1jsRfRlgw12TXJ3kKf03KSF+jxAVAjo
         QElOv5KWdmjLb920HHKQL+IYdL/mPUIimohD7m2G7+DNqC8anxdw6GHMoeDwiDrOiFjW
         kHWZkMyuHN40GOMLbQX10EJlKjqsweURzLX+89vgF9tO/1vzMXLgHgPIH+J9U68nolfj
         4jfNI4RzggwO7a2dcWmIv6nc9DYlQSctjvivS3dMU+8Fj99h0m9wlNIGZtaXRGInhuk1
         0r738cogP8PXbqyGQaqu0Mqv8XBOab+XAujlhus+JCQcbx4ibhXa3LH4qvIiuzsGDHY7
         XYDA==
X-Forwarded-Encrypted: i=1; AJvYcCUknE79TF/4FHpUQt2RJTBeEePiu8LPC9m6QGNTO0XPuzjrplfnsZuFQYcdgpV2yrRQq0E=@lists.linux.dev
X-Gm-Message-State: AOJu0YzMDdgP/0sNP0uzLRc9fCt3OMJbPtH/fejpBbTDL2FZXXgiVnSk
	5o+GYTKLUii2dY1M315hhnZqzfIhS2IFwh9MC1gFQJQJSExY8E+yWUQN
X-Gm-Gg: ASbGnct+2ilcOgNAsVah4J7yavIfsbehM7ZaD0KzZTJRMXlJ2r3sBkhG4msfqbSboku
	9Tj0eg4omAlgoWFn6T5VNjjpj1xSxc/97RlYiMgIFRYfsTEcBON1m/QHId905Qiz5P0842RjFxG
	Fr4/sd6+CQ4BPGSh+1pLpEK6HULYh6upUvT+YlOwZWjVTFei3b/8i40BH1CBBwciEmFCDXMABrw
	C6QbC6ypUA6+76aMDTuPXVvVuwbjKjzdOw5qV0iYx18rt63tNSChjJCnE+VSHiM+BNiTGJ2wvHH
	2z3KTS2CIeXZfrTgZrE6CbJav26yGN3Bk4AvIOcMXqnXjEOIqrvClrUQlv/dt4SBMT+PMbVSGSA
	5yDaD/6276o4xfxa4mBpTAand7zQMRztljkwTpl0ZzpIIHrbrjx/qxx3jt14GdjFCU19M3NrlIe
	/cIUbsNDP19u/HryQjUFhTBMqJMeZjJ81hUUWZX1buYRYLEfwA240=
X-Google-Smtp-Source: AGHT+IEqaf50xViFqcGYgiRoMt4dwJ2xrUn7bmjBXs3Kk/pC18UdQvc3UcQNURWNwY1ZJ/f0754E/Q==
X-Received: by 2002:a05:6000:3111:b0:3ce:9872:fd3 with SMTP id ffacd0b85a97d-4266e7d92eemr13663773f8f.34.1760441154531;
        Tue, 14 Oct 2025 04:25:54 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e1024sm23047515f8f.42.2025.10.14.04.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 04:25:54 -0700 (PDT)
Date: Tue, 14 Oct 2025 13:25:53 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
	Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, regressions@lists.linux.dev
Subject: Re: [REGRESSION] drm/panel/panel-simple v6.17 WARNING regression
Message-ID: <kcunz2b2usmvadgrnnu65op5oi5ttblrc463twgxp5gqhnufav@eze53y23avel>
References: <hlf4wdopapxnh4rekl5s3kvoi6egaga3lrjfbx6r223ar3txri@3ik53xw5idyh>
 <DDHZ5GO9MPF0.CGYTVBI74FOZ@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DDHZ5GO9MPF0.CGYTVBI74FOZ@bootlin.com>

Hi Luca,

Thanks for your fast reply and all your work here.

On Tue, Oct 14, 2025 at 12:31:35PM +0200, Luca Ceresoli wrote:
> Let me have a look at the DRM_IMX driver, I'll try to send a series
> converting it to the new API within today.

I will gladly test, thanks!

> I recently sent a series proposing to make drm_bridge_add() mandatory
> before drm_bridge_attach() in the docs and warn if that is violated [1]. If
> you apply patch 4 of that series you should see the warning.

I gave it a quick try and did not see the warning. Some printk debugging
told me that `list_empty(&bridge->list)`, inside drm_bridge_attach, is
returning 0. 

> > However, later on, another regression seems to be introduced by
> > commit 8fa5909400f3 ("drm/bridge: get the bridge returned by drm_bridge_chain_get_first_bridge()")
> > so reverting 94d50c1a2ca3 on top of drm-misc-next does not solve
> > everything. This was tested by rebasing drm-misc-next onto (260f6f4fda93
> > plus the revert of 94d50c1a2ca3) and then bisecting.
> >
> > So in v6.18-rc1, both regressions are present.
> >
> > There, I get the following additional warnings:
> >
> > [    9.732278] ------------[ cut here ]------------
> > [    9.732336] WARNING: CPU: 0 PID: 38 at lib/refcount.c:22 drm_bridge_get+0x10/0x18
> > [    9.744608] refcount_t: saturated; leaking memory.
> 
> Not sure here, but it may well be another symptom of the same bug: the
> refcount was not initialized correctly, so it is found inconsistent later
> when trying to increase it. Let's fix the known issue and then we'll see.

Makes sense to me.

Kind regards,
Ernest

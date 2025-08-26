Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D301DF723
	for <imx@lists.linux.dev>; Tue, 26 Aug 2025 02:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756176152; cv=none; b=ZPsXQWFA/xcPHoQCy3Aitk8EnhzqTa510Wh1COHrbT6SBs/txqklecJRStrYyOp0eHggn7O8p/B0oXvjkzBBA4+iRiE38SO/nv0ITfPriojy9L1gSIJnYpJDV9MpZB1lyf7/8DpY50DPDkGIz3YN3PlJH1pFPxQNzFM6grVCM1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756176152; c=relaxed/simple;
	bh=zYkRdlO0U18XSPpspud7s26YJzfHgvzhI+jZoKSfTqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nf7KFMIDGTjU3asiicro74QoMek8TgVBkRgcRXdJ3rBPXpwxn+fvQ9ZO2g7y7kkXXm7oEWhkCZAEUqYInOcQdT/SbEJeuXVav+z81LrXyKNUn1TntQfPllXEGBhyw2ti92AmpJfgWZua9sZP8yE9iqlTQ2n4Ry8ZMo45EjeC+wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bdvhzJS1; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bdvhzJS1"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-770530175a6so1311747b3a.3
        for <imx@lists.linux.dev>; Mon, 25 Aug 2025 19:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756176150; x=1756780950; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xR6DYc89vuHriP+8uKQP0na1daOwB9mmorwHUhrAVP8=;
        b=bdvhzJS1v39ktlVv1RudDL5Ne75WT2ieGYZqN+qEtK7HeJCtWHsphx2xmWPCWCZSQC
         +NZF9IeiVL0CHcBGc/p1IZPt/qO59nKB3bUAlce5bfMuqKmowdZdHloXwNbekpASnTk0
         llPfR2Rw/rAwHkE7WmuGTD/hAjndi690siNQZk7UFvmkgOcU10BwibAHBPoVzioGfCTg
         MBX7E3sQte4h/tSv7HzjmUQmQs2cjgINKl3c+WU7NoMFh1x2iqLHUsl5Q5FN+1nNQomP
         6FAVd4r5IHE46ACy18xoj4iJNKwXiLKUdY82lN/VscXKNJYNt6UMlM+0eGPNOyBzAXmo
         E74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756176150; x=1756780950;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xR6DYc89vuHriP+8uKQP0na1daOwB9mmorwHUhrAVP8=;
        b=rm24Wq0e3vTTuob/dwDvRa1eekTjDuBUaocOsgwGJ8URfjiKZ1qs5t2s4TVDlXM7md
         /HsC5xJJLdR3PrppRyuWgOxhiCYHEbmRSAfgEYO3m7Pvi5oCJyFnx4eTmqeqmdfQ84nw
         7TnOv4g5EufDisAnDWWFYlORVebitt6mhNzEu5erkI4SYt2CTDE0zCp/wmKECJb3ULIf
         PC72EpQ22AQLJQEva5sAj+mZNL8i/8lCo3vnCYj2KPlCWeJU7NjerqZFLtm+SjG/uHI1
         31tKPVAKCNwjhCGizal+cPreBbGz9zg9gMNwqAmuN9VQ5q3L7+lNhRGiZJwqX3EsQFJL
         DLSw==
X-Forwarded-Encrypted: i=1; AJvYcCUupIQ30ebLJocY1LslDPG/YqqYb+agvs/P1/rkR5ylliF0mUC9AFdYs/qv95vOb6r1IE8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7/hAQHz4hlwTBuiTipyTDC6Rw+GL1LakXdwaaQPiut6pwiKBA
	LVRqJTpfIGf+rrMm1fQNapjBU+lO+XMmfxygy1RH59P0cJGdzZ9f9OLe
X-Gm-Gg: ASbGncvR3XTT4U48yZJTyeNbnaCYbBNfys6B2/KkGVnyIpFZiXRpqXsPP/x1GugMpfE
	dh1n5iCovyOc7+pgb3TgpPX63fqmtULx1w2167i/gQiRhCfzzTSg3Vb5HS1TGQFfbzjPI0WPuAM
	qVWDJPRh4xsYT08RS1dM1uHI2uJOBEsr1Go/b4BXdVRRzuPMjJ4675VNXs9qeQ1fpGKTUQOJp9D
	YlZQRTPgT88LoOmV+J8nAyjUQUszR1U2ZelZCZ3KMuPSE/hZCkSNjpKVaDJv8tashYMeq/Bo5Eo
	XYgrIs18Jbey7SX+Py6Vb9fAumn0DOXzt0TalkwgulvLqrV9NBN7DWoscRqEwPNV6bTIMEEyJZr
	+z5YIwRBcWfwthoyJmWLUHfw=
X-Google-Smtp-Source: AGHT+IFpXXOz6jvKmc98oCi1NCiBQLg+bmp0DWJBuKZIBlouXbVcIiSBZxDk5lZs14cKqzF4SAkDxQ==
X-Received: by 2002:a05:6a20:258c:b0:23d:ded5:12b9 with SMTP id adf61e73a8af0-24340d91d6fmr19374286637.32.1756176150053;
        Mon, 25 Aug 2025 19:42:30 -0700 (PDT)
Received: from dixit ([2401:4900:1c42:3335:1f6f:7d68:6bb2:7634])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49cb8b4b98sm7835430a12.19.2025.08.25.19.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 19:42:29 -0700 (PDT)
Date: Tue, 26 Aug 2025 08:12:11 +0530
From: Dixit Parmar <dixitparmar19@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Haibo Chen <haibo.chen@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andreas Klinger <ak@it-klinger.de>, Crt Mori <cmo@melexis.com>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 00/10] iio: Drop unnecessary -ENOMEM messages
Message-ID: <aK0fA4QnFKH5AQas@dixit>
References: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
 <20250825093150.3ba23f2a@jic23-huawei>
 <20250825123919.3c228ef7@jic23-huawei>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825123919.3c228ef7@jic23-huawei>

On Mon, Aug 25, 2025 at 12:39:19PM +0100, Jonathan Cameron wrote:
> On Mon, 25 Aug 2025 09:31:50 +0100
> Jonathan Cameron <jic23@kernel.org> wrote:
> 
> > On Fri, 22 Aug 2025 09:19:48 +0530
> > Dixit Parmar <dixitparmar19@gmail.com> wrote:
> > 
> > > The drivers do not require their own error messages for error
> > > -ENOMEM, memory allocation failures. So remove the dev_err
> > > messages from the probe().
> > > With these patches, all the iio drivers now has uniform handling
> > > of the -ENOMEM while device_allocation and trigger_allocation
> > > calls.
> > > 
> > > Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>  
> > Series looks fine to me, after the minor tweaks to commit messages
> > that Andy requested.  However as it touches a lot of drivers
> > I'd like to leave it on list a little longer.
> 
> I changed my mind after taking the dev_err_probe() series earlier.
> I'm rather too busy at the moment, so clearing this out now will reduce
> what I need to keep track of.
> 
> Fixed up the () that Andy asked for in commit messages and applied
> to the togreg branch of iio.git, pushed out initially as testing.
> 
> There is still the rest of the week (probably) in which I can add
> tags etc if anyone wants to give them before I push that out as
> a non rebasing tree.
> 
> Thanks,
> 
> Jonathan
Thanks Jonathan.

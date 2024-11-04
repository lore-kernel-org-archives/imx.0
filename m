Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0191BF80C
	for <imx@lists.linux.dev>; Mon,  4 Nov 2024 16:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730737244; cv=none; b=oCknz9Ub8vTb/cN/vvYafaUSor/yUQ/dV3LqvKPUsA7EnGFsV2zp46FETvS1sTgqagAtUt+n/AZl+oSJVuRnJBM8lrXNWMyFccXo9WHYFs/qxAQSgJWiFQtm0bnv4aFWBJqf2fXKnYq2FHe579o2kFSvNy+4tsT9HVHj+1l97oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730737244; c=relaxed/simple;
	bh=ri037vIiTAraUe4D5nzgVsLRidFHjd9hHAKDBb1VgSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QrdQ6zTGP3Cgif2nfsLlWBm2BjYc3AIPy5JEXQeA9jCJD+5DbgTNWXEioClBaSsyxIXW7nCvCJw2isxfuns/anigKDFyp+mC0IFS14FafCo+vVU0YR37fBztIkvyi5ot1mHZF3mOQtqJMd+9eBaaUgrHh+VP5CESw7ls0u/BvNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PsesCKQ8; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PsesCKQ8"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43158625112so38279385e9.3
        for <imx@lists.linux.dev>; Mon, 04 Nov 2024 08:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730737241; x=1731342041; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/UglL73qHmfyJOd55YLmYbogEKgxUZxB1m0bcr6FhIg=;
        b=PsesCKQ8sR555p1ew2xftddRe8ilbJT1xOLTgWVaau//kdTbFDEvLXOO5wYyKhZAal
         pc3/Xjml1/EHQFV/AcjeEmOmztQSD+9R+YGy/y1cmYRQ+KmaCj07nPs3zwNavIDAy4WZ
         yrdpjn855fXswHQo6soM5OZ9ZExamZHXREM+whgA3RYvo8s1cUCTYfvsvKTcwwWYAHyC
         qCiFNCBHX9ENE2F1Rei6Pf0r6t8qHgjH5kk2DQooNXicXrd1IKoYoY5le46iF0fkkuZH
         CQxqFjQLW5LRNo4/OTnC7mDwqoHu/ZHZVGsWNmbO94QxDWqn3E/ZUBDyb2eKUcOeFKTD
         9FqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730737241; x=1731342041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/UglL73qHmfyJOd55YLmYbogEKgxUZxB1m0bcr6FhIg=;
        b=ZbxCFws0dqAGdMpKGnUfk9YMJoOsaJuyHXAUswt0OlErRPK0kaG6LSd4GrSxt3KHqo
         Cnx2R4ujTkMVbOMwjIhWqduvETfpjsmBKy4dS7PX2mPZpheKFq2b3D+s9LC608s6YgLj
         /Ku71n47YZaDuCuJ/rIoJ9gdN6Oyn2OsnShgXfYA3Jyajqi7tgmhocZj/yG0CeT2jRB5
         ihDNFYT9ghTGS4BTF9LY03k+WbKgWp8GBpzaiMzlJKcfy30b14Ec/Vlx8YSRWLFlU0Om
         ev/eiXuXt579qym10OD5o7nvGYs5q9+LryzDZVvF9xDCRYsx7/Q+lZTQgpRcM3zQzDdz
         verg==
X-Forwarded-Encrypted: i=1; AJvYcCUbLylIBKEBK0MTefW9mey7R59Ue/wJ86EuBLCMntyGW3tDl/+YXz3hErBvD4FF3fPsf6c=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy693PWUfoZcT++G950bAEalH6HVjGr6UVCXPSgdKy3kIv/O5EU
	rNqgSfAPeSq9EhraCmlQhxanfMgveMTxcVp6VVYQy+TOzR2gXQd+
X-Google-Smtp-Source: AGHT+IHZU9mbh3Wbll+wBrT2PpnMr8Te/FNGNRZcuvQt76LTmp8E5SFmnb1+Tbb9yqea8lWe/FbiKg==
X-Received: by 2002:a05:6000:1446:b0:37d:5103:8896 with SMTP id ffacd0b85a97d-381c7aa4830mr11584782f8f.41.1730737240702;
        Mon, 04 Nov 2024 08:20:40 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72:0:198c:8462:ddae:196b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116abdasm13770112f8f.97.2024.11.04.08.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 08:20:40 -0800 (PST)
Date: Mon, 4 Nov 2024 17:20:38 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Shawn Guo <shawnguo2@yeah.net>, linux@armlinux.org.uk,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, elinor.montmasson@savoirfairelinux.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v1] ARM: imx_v6_v7_defconfig: enable SND_SOC_SPDIF
Message-ID: <Zyj0VsTJ2qDHiss2@eichest-laptop>
References: <20241030122128.115000-1-eichest@gmail.com>
 <ZyXTFhEm9UCBii2c@dragon>
 <ZyY41nJY9ghwe-Y4@eichest-laptop>
 <065268d6-84eb-4247-b834-40a9ff32c1f4@gmx.net>
 <ZyiAMpjmXuVMi5FX@eichest-laptop>
 <787b45a1-9f8d-493d-8930-e1c8d396c818@gmx.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <787b45a1-9f8d-493d-8930-e1c8d396c818@gmx.net>

Hi Stefan,

On Mon, Nov 04, 2024 at 12:39:40PM +0100, Stefan Wahren wrote:
> Hi Stefan,
> 
> Am 04.11.24 um 09:05 schrieb Stefan Eichenberger:
> > Hi Stefan,
> > 
> > On Sat, Nov 02, 2024 at 04:35:19PM +0100, Stefan Wahren wrote:
> > > Hi Stefan,
> > > 
> > > Am 02.11.24 um 15:36 schrieb Stefan Eichenberger:
> > > > Hi Shawn,
> > > > 
> > > > On Sat, Nov 02, 2024 at 03:21:58PM +0800, Shawn Guo wrote:
> > > > > On Wed, Oct 30, 2024 at 01:21:12PM +0100, Stefan Eichenberger wrote:
> > > > > > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > > > > > 
> > > > > > Enable SND_SOC_SPDIF in imx_v6_v7_defconfig to support SPDIF audio. This
> > > > > > change will fix commit d469b771afe1 ("ARM: dts: imx6: update spdif sound
> > > > > > card node properties") which moves away from the old "spdif-controller"
> > > > > > property to the new "audio-codec" property.
> > > > > > 
> > > > > > Fixes: d469b771afe1 ("ARM: dts: imx6: update spdif sound card node properties")
> > > > > It doesn't look a fix to me.
> > > > I agree somehow, it was just that before the referenced commit our test
> > > > succeeds with the imx_v6_v7_defconfig and after that we get the
> > > > following error:
> > > > [   24.165534] platform sound-spdif: deferred probe pending: fsl-asoc-card: snd_soc_register_card failed
> > > this error should have been in the commit message including the
> > > information which platform/board is affected.
> > Okay, I will add this information to the next version. We see this error
> > on an Apalis iMX6 which has in my variant an NXP i.MX6Q SoC.
> > 
> > > > So maybe it is not a fix in the sense of a bug, but it fixes the error
> > > > message. However, I'm also fine with removing the Fixes tag.
> > > But this patch doesn't look like the real approach.
> > > 
> > > Could you please clarify the impact of the regression?
> > So the problem is that before commit d469b771afe1 ("ARM: dts: imx6:
> > update spdif sound card node properties") the audio driver was
> > using an implementation of linux,spdif-dit and linux,spdif-dir which was
> > directly inside the fsl,imx-audio-spdif compatible driver. Now with the
> > referenced commit the idea is to use the more generic linux,spdif-dir
> > and linux,spdif-dit compatible drivers. That's why this driver must be
> > enabled in the kernel configuration.
> > 
> > > Is it just this error message and audio works fine or is audio also broken?
> > It is not just the error message, audio is not working because the
> > driver deferes and because it is not enabled it will never succeed to
> > load. I don't know if this is called a regression, because the driver is
> > there it is just not enabled in the imx6_v7_defconfig. I thought because
> > a lot of the i.MX6 based board use the generic driver, it makes sense to
> > enable it in the imx_v6_v7_defconfig.
> okay, thanks for the clarification. From my understanding
> imx6_v7_defconfig is just an example config for testing. All possible
> users of these boards might have their own configs and stumble across
> the same issue. So I thought it would be better to add the dependency in
> the Kconfig of the FSL audio driver.
> 
> I'm not that audio driver expert and don't know how the dependency
> handling between the FSL audio driver and the required codecs like
> SND_SOC_SPDIF. So it's possible that I'm completely wrong here and your
> approach is the best we can do.

That might be a good point. I don't know how this is usually handled.
@Shawn and @Elinor, do you think this could be an approach to make
SND_SOC_FSL_ASOC_CARD select SND_SOC_SPDIF? It already seems to do this
for SND_SOC_WM8994 and SND_SOC_FSL_SPDIF.

Regards,
Stefan

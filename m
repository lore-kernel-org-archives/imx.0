Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9EB11711
	for <imx@lists.linux.dev>; Tue, 16 Jul 2024 04:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721104871; cv=none; b=CcSo+ZdI10MXcPyCAOErO09zSX7/gJnNLr2lDDFJY4n/vOCcQejbCy8a8V7/fVIPVZRtTqf2CmLxPBAnP/Eie4RcPp+ZSJaWceGsEWbPul1XIHkcI6HTF0sr3q2OnTWaZQEY9qgDALrG4M8nWYV/iA4b8wfwqJEpSVatmKkWaQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721104871; c=relaxed/simple;
	bh=hzYmxgDmvsP6hIVfcRVfgcV4s5KlHUL7eoF2AKFvUBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LWf2wwusJRrwxHs7wAcePVbVpxxaksyA7sMvwyk9ZB+hODZ14RcQf+dEU81fb+ezNISiGHv96ZtkGfHeycxqbtyQMlpP5dLYn3JX+c0rkyOwwxdLiNtfpvPTUP7DRsuZktuSRryyLJPlGK0MvoqlZVOlApgmomURb1GGIHfkjho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NR0wRwQR; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NR0wRwQR"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-643f3130ed1so45422727b3.2
        for <imx@lists.linux.dev>; Mon, 15 Jul 2024 21:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721104869; x=1721709669; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oNt0VrlwxxM/+VXkbaJkQD0zqJ7BRglW5s9ByOdVbmI=;
        b=NR0wRwQRwsSMpZcFo/rIZ4gv2EnGFDe0hkUA29fmJPJRuvpHiS98GFSkIhUB/xtkKb
         ql0wBckmNsRkcRmrx9YH/itVsKkVDBvLtmn01IpaJ5DjbW2Io5UQIBOPsgIuLZKWXa/l
         tA8FQ54mm/ic50iqZIMsxLHMWmbVB19QTzfS0Jv6gPXsfVgwgz+kQ9pVQ6xAo/XfOV02
         VOH67vAzBNemHUEXyEA5KtL5uo93LIVscF/cQRz2yzYs7x6R9bOCLtnIoBThWZv1YsT2
         gA3EGEauASODLQSV7KYOFs2O2D1VUPEZVSlCDRnJTQMr9Nv3+9FUYZ3tQpJRTydwsgzW
         sDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721104869; x=1721709669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNt0VrlwxxM/+VXkbaJkQD0zqJ7BRglW5s9ByOdVbmI=;
        b=swbfALCpivjraLTbNj+XvNTSxXwn0JHgTubm6EG4vQtK0Jg4IabCWJQ+oKkIr+FC1Y
         Mjy1pScO6fquwKZMbdG4LFWGW4awC75OY389NUBXTXQ/M4z83Bpe4J0RzYJJYSV5AftV
         jJtmTYO99MiFdBx38VDFy+2DYROOoAMDN1Ap1H+iZzx7MSc0bxEFmS7Kp39/6ZHUCwzU
         obc8kfiODKIP5RrHJM7W12rTm+cW26Q7Z4xztgV08iBHatBU1ubxIxrVmqrLDfTrdvva
         TMFAWozH/C4+IWfdzntVCekap/iyH5rtB/LmXWF3eF7SJ897bisfiAzqVYxGYa4xXyUV
         v6+g==
X-Gm-Message-State: AOJu0YxRMlb813aVg1Uk8wGvp0FpM+clhLqyvcjrPGexXey5eqVQUeoC
	ukLOh3C5gEafgKPpn2pIBBAzp2MkzAQixsliBE2cL4gL/1MJW48l
X-Google-Smtp-Source: AGHT+IHIec/0an27SOuTNnbL8RmkB+xctdldhSlhKPyModG7vZpxXpaVEpMrnMx+98lqMCN2xUlP8Q==
X-Received: by 2002:a81:b40c:0:b0:650:672e:9c64 with SMTP id 00721157ae682-66380e12b54mr11811167b3.33.1721104869417;
        Mon, 15 Jul 2024 21:41:09 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:6d45:d4db:b14d:ea69])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-78e34d2b21fsm3372881a12.47.2024.07.15.21.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 21:41:09 -0700 (PDT)
Date: Mon, 15 Jul 2024 21:41:06 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev, jason.hui.liu@nxp.com, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, peng.fan@nxp.com, ping.bai@nxp.com
Subject: Re: [PATCH v2 1/1] input: bbnsm_pwrkey: Fix missed key press after
 suspend
Message-ID: <ZpX54vqOo6RfuVwb@google.com>
References: <20240716000721.3485597-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240716000721.3485597-1-Frank.Li@nxp.com>

On Mon, Jul 15, 2024 at 08:07:21PM -0400, Frank Li wrote:
> From: Jacky Bai <ping.bai@nxp.com>
> 
> Report input event directly on wakeup to ensure no press event is missed
> when resuming from suspend.
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Acked-by: Jason Liu <jason.hui.liu@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry

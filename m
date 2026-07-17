Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B126292B54
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 13:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784296020; cv=none; b=STXNPKK6HF5ReD1CrznMQBD4S2ybWOBfHKSzwljvp+7KnVgaSoxpy6wo1UBfjgrxem6yUAnpimHrLuPR8rb8KGAMFpD/qgUKe8+oub0Wh92OqKZMmfUQX5oaLD2XZCbXC2prtYukOdJbBc7y5Pr3LVFH6dDjxY5PidmlfLKEGF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784296020; c=relaxed/simple;
	bh=pkFpIKsnXuNOL+ArN2UIRyweTbPgoDEDn2DJz7Lvqh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KPbsOv72c9hraUCeTbNi31fa1WdliWF842VtdOBlLeu2S+ndefVkc15ErGlYjT8ZoXjNI26Mctb4an+r9Rn/RH1QInWTcI1tFX1ieYm3HOmRYGNXel37MnDQNKLAmiJcDnrhfy6udLhVvKo0a+xcchnfQYt6Y8KK+FWRLgkNPsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+lsw2K0; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+lsw2K0"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4954aff6088so3900615e9.3
        for <imx@lists.linux.dev>; Fri, 17 Jul 2026 06:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784296017; x=1784900817; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=usUeK0ixpk0N/58fI6VofoCsRjg+TZxevKmDKvB1suE=;
        b=g+lsw2K0Kkm8tHsj44FFYpY3QcU1kF3qAJI8yxeVnMTaxEo0Kg7NWgMWAPHd+4djtQ
         zg/Wt1oVhM27m98M27XqHdVl/Btgmqvw/g+yV8HC3q2nt/srChPyR6GqRc5QfC5R3pPh
         NDC3trSYMSCa75W+a/IMGUOZ9mr2F+2sn6zLgSZysAKqsAIkYyO4uY+4rk7ZE5Jdz+K9
         4RxcpbXHe/KKCDySTOQ5zlEqQRNRGviYI5pWSnO5qQZ6wdazNVknuC3jEfCYbFJPoBb/
         6MOqSlBSZAB8wS422gC5hTUW66tHlxGiGC5t5jRCUdUUbnJOKZKAV8baJq6hnfnyqHun
         uZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784296017; x=1784900817;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=usUeK0ixpk0N/58fI6VofoCsRjg+TZxevKmDKvB1suE=;
        b=H3EnJjZtolkhf58VvfnzJtb06uf+xjbIBqbm6tBUUgPQAvTS3yxx431GRqYn14VHdM
         ZTUB6kdagY5OpUIbSGeFZoVGCSArW4tc5UHK1uw7LQ9SkP9KXoQfDRkJ+BY6ZV1YVwb9
         i5NYPebeTAd/m39A1TVnpTQr893bd2sYX3CeedJj971AVqKP1esgaPY91AG2lipqsVIj
         U+6GdK9ULXcTsgvpoXYufOeceYk6hJ/840U3xiTVG2AUZGKaJv5EyUVTnN9IYz3H+0dO
         nnJogXK2V0iMMNVzzWU4G/W6spmFuOachakDERMuLuPKMzUAUHHTrFRnZVyEoZ5TEKcB
         GOjg==
X-Forwarded-Encrypted: i=1; AHgh+Ro/gvP3uNsCOUEZvmFSpPRiZ/SqjGV1ySJrmaNjQ83ZyWdz0it2M06lkWZFCcrvgH8uFsk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwM974st5mhwnlO8QT8MEMq4LTnWDd1R3JiXpAkibiBvesiPJMN
	Xu53jmX1b9bBzu7oSK2uXN4AdwngJoAMgelbfJz9UseJENJGkeJcRw06
X-Gm-Gg: AfdE7ckU8t3utZejNV+iqjcfQz3MjjhC8Q50XwpAtQSiF/z14eUZVYAssFZLydm4Rpq
	cRNoCR85ZBjibZlC0frAuHIjusZ6fuQBTd5KUY/6GBr6RDj9UkXO9xZWZz7NlA36jWsGhS8hKYO
	Y/mEa3jSwhc0ev93CIo7w/74k1K8rKyiGB2ZyYgKL4in2G9NSqHh2GK4JvUtQoMeBAvjU4ZF755
	nzM/fHVAk6ZxOVkVvXhhOfggf3oFg7rG/sTCdnQ9qlkyRGzYX6ADxdO5wCRksx/2WZLlX767vtT
	DfNkTpX5UNyCyYb4tCtP7/CjRHcWQhs8BWlrh3ZWbKFr+L5cTYZ/okogUxw2KEjk+HPu3YYGyj+
	/3EUfNIZhxzA65cQ2EDCOlbZ5xKD6rla93nJAfhzjsA1VYr/gJqdl/mFWPyN7sgz7wf+omX2f8h
	zHtMWmK2tf5kg4pw3bgLm0HPFzrtQlWiNZRYllis6eSMDoGni+CzeKBgI4V3GHU5ujQCwRT71bO
	1s3PbFplbZajrxHUwFkug==
X-Received: by 2002:a05:600c:6a08:b0:493:bcba:46a4 with SMTP id 5b1f17b1804b1-4954a404528mr19709365e9.20.1784296016986;
        Fri, 17 Jul 2026 06:46:56 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a3f07esm51142905e9.6.2026.07.17.06.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 06:46:56 -0700 (PDT)
Date: Fri, 17 Jul 2026 15:46:54 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev, Frank.Li@kernel.org,
	imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH v2 05/15] arm64: dts: freescale: imx8mn-var-som: Add
 support for WM8904 audio codec
Message-ID: <aloyTsfV5ngd431Z@Lord-Beerus.station>
References: <cover.1783330236.git.stefano.r@variscite.com>
 <4487a350b0e4667816c3fe62e9fd6df2696c18cf.1783330236.git.stefano.r@variscite.com>
 <20260706100948.DDA391F000E9@smtp.kernel.org>
 <akvC8UV5N6Tpk0_h@SMW015318>
 <akz_Lr1bRSEE5rhC@Lord-Beerus.station>
 <ak1KYjOUWDy6po5j@SMW015318>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak1KYjOUWDy6po5j@SMW015318>

Hi Frank,

On Tue, Jul 07, 2026 at 01:50:10PM -0500, Frank Li wrote:
> >
> > Thanks for pointing this out.
> >
> > This audio routing is not new for this board. It follows the same WM8904
> > routing that we have been using on our other platforms for quite some
> > time, and we are not aware of any reported issues related to the
> > analogue microphone path.
> >
> > If adding an explicit route to MICBIAS is indeed required by the
> > codec driver, then this would not be specific to this board but would
> > potentially apply to all of our WM8904-based platforms.
> >
> > I'd prefer not to introduce this functional change as part of this DTS
> > alignment series without validating it across all affected platforms.
> > If needed, we can investigate the MICBIAS routing separately and
> > submit a dedicated fix covering all WM8904-based boards.
> 
> Okay, thanks.
> 
> Frank
> 
> >
> > Thanks,
> > Stefano

Hi Frank,

Just for my understanding, is this patch series going to be applied or
are there any further changes you would like me to make?

Thank you,
Best Regards,
Stefano

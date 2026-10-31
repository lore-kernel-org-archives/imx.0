Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793454312;
	b=FxswC4QZ4QwRyRezDcpxsHR++nMWikukBJek857BTOziF9Yt3JYrh/7hpqU50EFbuBsv
	 qF3GSq4S8AnSR5mHql09OTY1zEdHSqKxk1fA7I/KL8yBITDwdEtJ4hBVyCmpN7rj57n4z
	 dnpM/eig18QOZNXLzId3xDqjolqvO++fiF4O+OYogkZYzpC5DbqosJiIXSeL0zgB4nRtv
	 DdCFsAxYj4b9rX318I25YraOQofbM63lpELiG9/eRaqPoTU9+Htg1I+05c5naIt4HII/k
	 HeY6bKxO4HfWObcG1LfLLfxtWVql4jRb0nHIjPJRqXLVF49jTqiO6fPaEj/wzC0L+iQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793454312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ydiuw2JFoGviRXfS/1qoEyS58uTjOZNZXXzHRdS4SA8=;
	b=s1aSaEe85p1ZHp+Jugkqrau4EXS2YRqwhWyQdhAGziXpLDX6knAzmdtMrEFdy6IcBQyf
	 x17INtb309eglLT+plqIx9puGIe7miDYA8WfQ8pe+A8Px+19S3yLqYpZJh8LvxBPejekB
	 pJfqzsogiEbtPLkuEBIsHKuOHvKdN0ZrDpgAmS3kU3qKUhD0CW9xNiNpMb4so9PBLia2v
	 BsC6GqlYYX8qhGrNJxAJ4bJEyYQPB9dpwobWo9CCY+2Rrq6zpRbTe6LEd70s94nIZ3+RD
	 vWRDHpJrJPJgPf9q2bN8MNXDpBdS6L7CL+qM6TWA7Xx8iMfzlGzhPMhjykTIofr/JYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZE1O4HlH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA536606A327
	for <imx@lists.linux.dev>; Sat, 31 Oct 2026 13:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA536606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZE1O4HlH
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b3dd83e779so2761754a12.1
        for <imx@lists.linux.dev>; Sat, 31 Oct 2026 06:45:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793454310; cv=none;
        d=google.com; s=arc-20260327;
        b=ZUbJPiuMdbqt0DV7bibSxycl8uyBqnb1Nb6gUzJc/2sVY5AU01/6Z+x4qJotPToNRV
         3qWnSBwbfrjcHftkjdtmlgPASODTp8hwr4ruOoows3S0HEBJ9VoDtnBf4jEwVjA/hUCc
         +5yLOX1mnV7HDVFLyc8Qt3Z5oBrQzUGP+6qZNBKic/duG3dbR6IPjvoH1Bl8wNEHQP/o
         AoShFu20ox7WI5Qdlngv5pqOaJNNY6oDon29MAmT4n+du8RNSZJrESINBELtap/0nVXV
         iByqN0VeDmcVC+XO77kfEe7xHMW4kDTwLADlobm0aW6Qz7y8tST6FY8icu6pYdRplZd9
         cNHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ydiuw2JFoGviRXfS/1qoEyS58uTjOZNZXXzHRdS4SA8=;
        fh=OWhlz+7AmueT8y5nOqd/ZNaNnSo88HQoOxtz/o3S4h8=;
        b=SYgpkh8ZEZge+aWkkLXm98VNnxplEMcKEcRKfzy8yWbtaWg+x4ymtATZVgpenNpLV+
         qmRw0TqHLfUTrAN/kPGdT8fAtO3iT3V+uqeZ/ucTbqyYNEcD3oRWcRqk9yTJsCyLXD8q
         vUGteeA/psHzIyGfzlxM+ydEmQLLXgAzw0zkpKY34cLvaJpA/WwWbOK9ZV3JbjyDmMMV
         8ZD0UpkSTRXDyAtJwAEx86i7Ukqj/jFI71ln+aoaENY1ipH5/WPoKIqw3XR/f4LfzQhj
         NoRIVMfCDF2dcYaJNdpvs2/H4dAWvWi9VVcai817PJz8kUN1ckvBC0LjiUZftvEPaCfD
         0BMA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793454310; x=1794059110; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ydiuw2JFoGviRXfS/1qoEyS58uTjOZNZXXzHRdS4SA8=;
        b=ZE1O4HlHHmekpmbiZer2D2dRx4wYm2X/EGjhuLBRbHWT5whLcHmXDsgokA5wDqMkDA
         fREPKJTDrrRTeLv7L49mTMi9/1CGvruq3rWJrETpKZcA4ob5qmVxfTKTh0Ma99eI7Nqf
         J9gcslOdH7Ckdv84x5UqpWl4m4uAJCqhQY6o8sY2M1nlE13URJ0n6khRg2CX61KKFiyJ
         uXD2/ghIwV0cMqctsnLEOxkCvDoiun7k9oT82y7POkj0UbAtupO4sXSj5J+/ziK5+tM1
         zWVlYhiB5lKqQCagUNmw454LHFZw8lLbmN9jDt85swKGhzqZsCmbay6f12NmPJJKahvN
         UZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793454310; x=1794059110;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ydiuw2JFoGviRXfS/1qoEyS58uTjOZNZXXzHRdS4SA8=;
        b=Isjv7dKbKj+g+i/UrHv28F4LmlGur59xht3TKD6ZWCP8JSaQPuHke9FtbBBjXJV56m
         tN8Oosg8h/F/AJMnOfG0BAFd8ZxqtQZNulhgqBWcfhzVdM162s2t6yTLgd1gLqVp7YmG
         2vf6hUn4p/7bI/xFYcx9KcbtDl05chdUvrsi5/VPod9I+jfK7mbeUxR885IgpuHHPhJn
         CcL8sIsRel8xdqdm/vDOtdFrwGAxr9GoIx7h9PKSnwClCSlj0x/2pZ3c0bVcyMqDED4k
         DMNdzBPgl4F+/7B7cWWla2Pz6nXtLA2VrOGpsWtsLrtxvVJWqEjAIOSQ+FkI2IOugHAB
         Hh4A==
X-Forwarded-Encrypted: i=1; AKwUvBy0Htbz9J+sfaYnpE8T3dT6yFRfK38VTWeE5eKUC0+Z2e629j7oOOiwgM1TRtyY/fuQEeo=@lists.linux.dev
X-Gm-Message-State: AFq9FYLfHhHhtBLatsmh2zkz071ncVrWpYuH6xrt/1zhROUHJf7ca4I7
	CgU2/T7i8KQ8BUHBSiRH383NGkAH5Qx68hn2kL70oiz318qKFkl13NVlnxRCRbpfKxDvGA/bvWY
	tubcZgSOBWzORpmnmQ/cIalQnnpQ+FgM=
X-Gm-Gg: AYBFou0KUJGasA69mSv8cUSSq5SPetN5WZWrAUK7GMibkFIHWCWuBH8ijYB3hqCxw8G
	KWfpwDJ9q/XrK4I6S6iy7Eu0euOvwLMuJovw0sDjxPPdWUgI7JJcfZ/B4OuGrPd5yC0MDc0Gruk
	V7nQWkOJQU5oVoEL0AYQLjngd2TiS9YSE9VSwBZzQKYE0CL+ntDwhUxyyCkEst4Edwe6rGkxeGh
	EOGwETpiHEsgeT9X9eouwqY4igijb+WDmSM5Hls3x7HlRk6omlXKTUcLEvBkHf5ZP0VIMCp33z0
	sAeZcr712VbTWeO0XAe6nUXOs4KWR8rZg+OtlBgffcX+ZdTEPUb/e0Ke0DjDxtsjZammCyEYAYW
	K8BX1OcM5EYae+R9/FmnjqozS5cYcMNFP1phdg33UFrPBdgOHtR+nddJcPKZH+G+1HsHV4tk=
X-Received: by 2002:a05:6402:1ecc:b0:6b3:d0e9:2e87 with SMTP id
 4fb4d7f45d1cf-6b4ee0e1f24mr1392387a12.5.1793454309714; Sat, 31 Oct 2026
 06:45:09 -0700 (PDT)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261031005425.3351240-1-samarth.colleges@gmail.com>
 <20261031123749.3783352-1-samarth.colleges@gmail.com> <2026103143-alienate-subduing-50f6@gregkh>
In-Reply-To: <2026103143-alienate-subduing-50f6@gregkh>
From: Samarth Narang <samarth.colleges@gmail.com>
Date: Sat, 31 Oct 2026 09:44:58 -0400
X-Gm-Features: AclHuK_UZoL4ALbG8OiocStKAY43wgTppT1vPowuPmaCkqxwveQ1ulzoHGIddAk
Message-ID: <CAAbz3fR3DxTL66-0MJVsoWq5-FhypwdDn6=A5iyLUKY_LyOD0A@mail.gmail.com>
Subject: Re: [PATCH 0/2] serial: keep the flushed TX buffer mapped until DMA
 has stopped
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-serial@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Greg, I will address the findings Sashiko found, would
appreciate someone with hardware giving a stamp of approval!

On Sat, Oct 31, 2026 at 9:00=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sat, Oct 31, 2026 at 12:37:47PM +0000, Samarth Narang wrote:
> > This series addresses the DMA buffer lifetime issues in amba-pl011 and
> > fsl_lpuart reported in the parent thread, where flush_buffer() unmaps
> > the TX buffer before the terminated DMA transfer is guaranteed to have
> > stopped accessing it. In fsl_lpuart, the buffer is unmapped even before
> > termination is requested.
> >
> > Since flush_buffer() runs under the port lock and cannot wait for DMA
> > termination, both patches request termination while holding the lock an=
d
> > defer unmapping to a work item that first calls dmaengine_synchronize()=
.
> > The TX completion callback leaves the cleanup of flushed transfers to
> > this work item, while shutdown, and suspend in the case of fsl_lpuart,
> > waits for the work to finish before releasing the TX DMA state.
> >
> > Both patches have only been compile-tested with arm64 defconfig, the
> > relevant drivers enabled, and W=3D1, with no new warnings. I do not hav=
e
> > access to PL011 or LPUART hardware with DMA support, so testing by
> > someone with suitable hardware would be appreciated.
> >
> > The imx driver also needs a fix for the issue reported in the same
> > thread, but requires a different approach because its TX completion
> > callback unmaps the scatterlist unconditionally. I will send that patch
> > separately.
>
> Again, these need to be tested on real hardware.  Not to mention the
> bugs that sashiko just found in the changes as well.
>
> thanks,
>
> greg k-h

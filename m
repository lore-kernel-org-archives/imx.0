Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568C430C62E
	for <imx@lists.linux.dev>; Mon, 11 May 2026 07:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778483022; cv=pass; b=ufAZnUHplp0zuVxeWy8fmwdkCkcyHFsRoW19wOSt9VTyCuqGNyVIZtgrgfpVoCre1cDQzEPdtcMI3abSAqn+MnnOEdgrpK4LZv0VBZxfzju9kiwGFRvg4vauSl7WVtVPrkDVoCiBs6213fXAP6IeQN8soLgaTr8KDHSDyZyXQHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778483022; c=relaxed/simple;
	bh=75WL9mRL1dCJuocUI08WGLFPcO/+haYZ+pjQRPIFdi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pWAE3xICdEYPhHZrXCZ4A5TlRMkZubgfucpbHJ54LCpen7imi8fk1/mvdTf1v2rsWynlmoj7ZV7xHXGtdu0ihsJtW/qsQESiM2/+aYhwKEmd0hyX/2FVOoAUjzkic7Mm/xIuxBUG4HUZM0UMX4XwNWF8/hzyzaVVeCKcvzCFyH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=fE7gbMPS; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="fE7gbMPS"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a858881ad2so4094887e87.3
        for <imx@lists.linux.dev>; Mon, 11 May 2026 00:03:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778483019; cv=none;
        d=google.com; s=arc-20240605;
        b=UksRBj4QLXmAZ9sBLLZaOp0YAU+SSag1pDAmZdOPr50Y1zjT+BkclaQgmYynHZ12ZM
         G5j39ZXRnxQx8b971uKXhYNkmD5DAastlZ0VbEXIquTZyiaSOiI4wfKc7PjdquQqrDJM
         xFDJEjFF8igYGz02RHKZyYWnWZ6vX/eSukuFzRMkYEUMpjmO5rqHcy1YXsWvhuNgatcO
         opgzfd5pPDg49oCT0x3eO5dJNkaGcZ8UHo88bUscl5+LbCQOP7m7OpfGItU+CkqLvqIO
         w/z9fVIpJntaGpJoE5tzlYbdOWko+SQ3YYrKrqxu+Wfq69qvXk7N1RDOJHgvCKtU02sa
         9OVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=75WL9mRL1dCJuocUI08WGLFPcO/+haYZ+pjQRPIFdi0=;
        fh=JF9XkFfkZqkkozuH6O/aoz5O7tgdoB/Az/X3spI4tQ0=;
        b=VPUAWsKTD95X/EEsaZIf5ujpgaoiMK8rrh580bExLV0rplhxL8XBTHrq4E5XYdy/u/
         5qVEqunrgo1i5WXpFHD//tCGyDeLetPMYY97ei/Ckq9swjwV2cTTug4sIgXxhjLuOun0
         QB8R7Xqjkn2Fd82tWrQSGWWknBifFukrFEfkVsE2he9dw2nnuV5XnO6af8e2XaJO165T
         ovqEXEfnqQ3oZrNhKnrZcWZUlDswX9l9Ysu3KlanfRr3aLyrCfnus0/fnDLPG9p9aX/T
         cQGw2Mg5QxAaViF0ZquD+48HNhiMXAzAO/5wL9osgus/xAyU3HyMl2w9hBG8Y71R6cX/
         bEhw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1778483019; x=1779087819; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75WL9mRL1dCJuocUI08WGLFPcO/+haYZ+pjQRPIFdi0=;
        b=fE7gbMPSZ7b5hESaXPI4LwOLsqrmXAXEEUzJMa2y+XE6C3DbXLugKs8FUARAaHyMFS
         gX035U2bMfxu2vKfrTmVYgd8HLlq8UjPge74Pg6Ly9GZ/PrtT87XJ/Mq2omHVWZBVKib
         CjMdH4nPte7vG4vkpKxtTgdxga6Pg7qroC97k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778483019; x=1779087819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=75WL9mRL1dCJuocUI08WGLFPcO/+haYZ+pjQRPIFdi0=;
        b=Xuo3sDgG9hTcqA+MPX7UdCMRGfCfcclLdjGVEZhq+esKvawbdCk3V9rrcyqKQ5bt+x
         pvxn3Xfhqh6tKkTwcn6KnyPgESban/t7lZgSMRyeFkcd4D/a8FLBm76AN+rJzGHiZzkA
         qdudCYcVRyG9pyljdTD8Is/1WnALnS2MHy5PaVjybS/+8u/NwqViNylQFHd26atpMnrq
         ztr/CQIvk21nJgrQp7y79RTpISzkgDp+xh3mVzUn6Uvl75c3jFmGEJF5yZFnvHIkvXhs
         +p9JKrsiQGjG7Yt00V8upH1hJWEia5KMkTQ/G/iCcbUBhVhMPYVixrFU4HtnDDkNhfSS
         MipA==
X-Forwarded-Encrypted: i=1; AFNElJ8CCF+JYdoJsi1DHStTcufcTNIdGzXWcwjTyehvhyXwMSNmzjRGYC8cmfv0IBIV3PKyaVc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxTFOBG/mzP2E0J77HJl1Ip7oHNNRkxC0p2+MfEpa2b3EN6GHvX
	oGP7Ak1sG4/O8LoXtuRMv9h1tgF5sQ5DQT7E9R++dQON+eMWRxuWzneWdSsE1nTnr9eT4Ok9AWE
	luU0HHI9379sC9joZ1A6aVHj53bHDWzkhm0nAs6nYGA==
X-Gm-Gg: Acq92OH4pRwlrB3Hv9CPVZ6RqKp34x6c7/8VQncAt5jKY6NYyagB3xr4f95VKc/mOPt
	xRyvtGO1eYrvP0Zkr3ZNp+uu7MPMDmtU6rwdVn8yoa3JgdgA+VJ3qsW+GbYnL8VRO47bsmIxz/l
	Dnngv46PR9XPwc8s0OvDj5YkTi5AtVfTI2/Q/23924+GbTvHQAa7PogAok9H4X+9uZmsSX3m6+v
	8vHPqWoWpg6RwW69QhjJrMH3BgqxLpZ4rPHiEOwAH9RaOHt5P8O6iRbAeYTC3L+VI/CNyvYrwKB
	nKJVkBGNTW9pigE=
X-Received: by 2002:a05:6512:4008:b0:5a8:80ce:ba55 with SMTP id
 2adb3069b0e04-5a887ae1e90mr7551438e87.11.1778483019285; Mon, 11 May 2026
 00:03:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260430132140.30369-1-r.mereu.kernel@arduino.cc>
 <20260430132140.30369-3-r.mereu.kernel@arduino.cc> <CAFEp6-31LQX+uHJ2PFES76RGqmZKS43dO3UoziVZ-KWQGCy6aQ@mail.gmail.com>
 <a6d6e638-6e61-4e39-9e06-bbac7703c6ac@oss.qualcomm.com>
In-Reply-To: <a6d6e638-6e61-4e39-9e06-bbac7703c6ac@oss.qualcomm.com>
From: Riccardo Mereu Linux Kernel <r.mereu.kernel@arduino.cc>
Date: Mon, 11 May 2026 09:03:27 +0200
X-Gm-Features: AVHnY4KqvZ7gjq-ivtySQtnC8vX7jHJ3zr9wVqg3mRzKVkPEw_LUG_hW37iSbSA
Message-ID: <CAKA1JhZHDPWbJVSuu3X4PH3T6Ko-uzZ6ktA0i+-w919ffuvEuw@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: qcom: imola: Move analogix video/audio output
 to dtso
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, andersson@kernel.org, 
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, broonie@kernel.org, linux@roeck-us.net, 
	Jonathan.Cameron@huawei.com, wenswang@yeah.net, naresh.solanki@9elements.com, 
	michal.simek@amd.com, nuno.sa@analog.com, chou.cosmo@gmail.com, 
	grantpeltier93@gmail.com, eajames@linux.ibm.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, festevam@gmail.com, imx@lists.linux.dev, 
	m.facchin@arduino.cc, dmitry.baryshkov@oss.qualcomm.com, 
	Riccardo Mereu <r.mereu@arduino.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 8, 2026 at 1:19=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 5/5/26 5:44 PM, Loic Poulain wrote:
> > On Thu, Apr 30, 2026 at 3:21=E2=80=AFPM Riccardo Mereu
> > <r.mereu.kernel@arduino.cc> wrote:
> >>
> >> From: Riccardo Mereu <r.mereu@arduino.cc>
> >>
> >> This is done in order to support different video output over DSI.
> >> Since audio part is linked to Analogix USB-C controller it is moved to
> >> the same DTSO.
> >
> > I'm a bit skeptical about having a separate DT overlay for this. Is
> > that really the right approach? The Analogix block is part of the main
> > board,
>
> Oh I skipped over this!
>
> So, does the media board require that a switch is flipped or something
> like that, to route the lanes away from the analogix chip?

No, DSI is shared without any switches in a "Y" connection.
I agree with Loic that not splitting that part but modifying it would be be=
tter.
My goal in doing that was to write as little as possible to allow a
bigger audience to play or repurpose DTSOs.
Since V2 has no panel I'll avoid splitting them anyway.

Riccardo

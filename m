Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8694E2C0274
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 00:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773188189; cv=none; b=tBak7VjTSITbRUqGs08MSnm1gjIKFy1A+W0jXlqv7mB5Z9xCMZR7sDIiYKFJH578+3T9Evydn9X2JiMwBy8KtX6Tip4p0tEUM3rnUJ9JNyUJeY9komb28cIB5QLTiyQ1Iov/dkvrPjpBAzMBB8yF7NH1ArGmiSeGEXU5lmW36l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773188189; c=relaxed/simple;
	bh=RkQr/oJ5AVva8ppnZ/QxljiNwt7nDUcsbBiCUPkROPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bfjgVtxppcFeqtK7hv/1B+LXgJiPLIIODiuMO8KxgwitVXlnjjpHivQfLm33GbHow2Et70Upj5tSbaO5+4hzylDWFmAa7uWdpjy61NltvO0+iG/nDZ74IYO7V8Jnze3oAMP081wu6ROJiPuMGSCGCJSD4XvQwNDCXaFbBI8Nos0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GyZe7SRR; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GyZe7SRR"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b9704cd6951so251509666b.3
        for <imx@lists.linux.dev>; Tue, 10 Mar 2026 17:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773188184; x=1773792984; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkQr/oJ5AVva8ppnZ/QxljiNwt7nDUcsbBiCUPkROPA=;
        b=GyZe7SRR24GjqP/j381XHOdejpOiqDV2ZcVyc0IgN5GCUh2iEz+Eaq77KMjcs5TyKO
         MnVOLyvyOasaLTeDub29KOlwgmo0OuhbOntbN1hAy+D/MBB9+MsiB5TlWhCH15KW3jrT
         6Ep7I4jZTD5X9nX9QA04+Dny9KoHoF4OaIqAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773188184; x=1773792984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RkQr/oJ5AVva8ppnZ/QxljiNwt7nDUcsbBiCUPkROPA=;
        b=ZpU4nHXbrWgDK7v0ywDjHshNrYtngq7AKkixIzzGKMWowk0SEhgPR2gZckf879qdab
         Xo3Wm5JezmUzURo6/hHw7MWMKUkXPSqDe/O27B23QlEKJxFs7SOC8dC7XAbwxqlsa3ED
         G3DnGY310CBbbLytV9bFeKNWSBqOU+zrHa7zmFZiQiroJxdWtRRyPZ4ZY9VzcZouJMq8
         I2Kk3VG2QDLYwVSyN4zTT+MQEmJ//zGPV6uUpCB+sk68VRURFVVZyicRDGpHeVJsJVtD
         w0jgL6fVjQz06Kgt5lfOC7mWEQzEPy/+1Qmj2sd0nokmdh3bAkEfQQ9nRENv5gdYZAzg
         zA+g==
X-Forwarded-Encrypted: i=1; AJvYcCUudqrqVrEWcq4bxkr2mlPYRPJ6oZTD9vODi0ii0gvHjr5/CHPONEhHa5oc/rw3pMMXZ1g=@lists.linux.dev
X-Gm-Message-State: AOJu0YwP8SHVbjzcy9tOV+zq2C7Al/bbKu8u2XjZPUn160ekTHeY/4PR
	iJ8mXn+Z6uKHwCsiGv2hRkezH9nwfu37Cp+EXSoIcqxGb7TwJMlnKyiMU7K3y8ebQ8P/S2e56U4
	jfrlWX++o
X-Gm-Gg: ATEYQzzFO9QSxMtRuD1xb6b0YqNVOCx4ckoQ1dckVtqA7jOkKhXKqRmQ9wqTi5e/Jsn
	xQ1VgUZLW0KckacR8OmdAykEz8lkujQtJh/ATOcgASIu4HC5Two5jwtABVupyGvdWcbZ0IqIVXh
	1d7BrgpHl0P3a/PMAOwQEhN7FLh0GyI2P2uPLWBVT6A0PbsNPBXts9XikKiANePgZmrDY7lrHVF
	cu5NN33Rf1DgdMRDu7zhNrnhrxDIe+gAdJh1WNaCXTFObQ8ik70MVNxkSR2PffWoH2ef11CzOF9
	hrK34P/cMJX53mAZmqRd/vhYbo4aljjMe6hDHeh62frDp2mGvdEBWkMxtqPBlZlvx3VLYLgE8CM
	MZ1SL4Fj70j20vEb/YEpfJrTPkVM76qSPrvGV645BynfZyur6fn6H3wOXpY+8/Bl11n3CcfKnEz
	qV1M+3i/r7N0lZrRQ3qd3eQFKHwkxbX7Maz02ZvfHjCf2dayjiJaItFdZRL8iIUg==
X-Received: by 2002:a17:907:1c20:b0:b93:3d94:2e01 with SMTP id a640c23a62f3a-b972e4fcab3mr16796266b.25.1773188183718;
        Tue, 10 Mar 2026 17:16:23 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972de08ca1sm15058566b.10.2026.03.10.17.16.20
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 17:16:20 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439af00d33cso10631118f8f.1
        for <imx@lists.linux.dev>; Tue, 10 Mar 2026 17:16:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXW1J5OfX9qaHYv/CyP97SLY+PqgY5YNEEiNmdOoFmANhYW4LvWyLZpBqJk5pv50mI6L/0=@lists.linux.dev
X-Received: by 2002:a05:6000:2913:b0:439:b3d2:3768 with SMTP id
 ffacd0b85a97d-439f81c8cc0mr1467675f8f.21.1773188179252; Tue, 10 Mar 2026
 17:16:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260216181002.3475421-1-dianders@chromium.org>
In-Reply-To: <20260216181002.3475421-1-dianders@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Mar 2026 17:16:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VUUNDgcOMjhA3Tiptwm3-s+LiUNeObAoV4tTQbkg0mPQ@mail.gmail.com>
X-Gm-Features: AaiRm50L1dSQfXqKqL2lF5VIOHGsndPMM8bpxj2iTcUPN8asbNOQBrAMfnlkmEo
Message-ID: <CAD=FV=VUUNDgcOMjhA3Tiptwm3-s+LiUNeObAoV4tTQbkg0mPQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/15] mailbox: Stop sending NULL mailbox messages
To: jassisinghbrar@gmail.com
Cc: Frank.Li@nxp.com, Santosh Shilimkar <ssantosh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, andersson@kernel.org, arm-scmi@vger.kernel.org, 
	cristian.marussi@arm.com, daniel.baluta@nxp.com, festevam@gmail.com, 
	imx@lists.linux.dev, jay.buddhabhatti@amd.com, jonathanh@nvidia.com, 
	kernel@pengutronix.de, konradybcio@kernel.org, krzk@kernel.org, 
	lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-tegra@vger.kernel.org, lucaswei@google.com, marco.crivellari@suse.com, 
	mathieu.poirier@linaro.org, michal.simek@amd.com, nm@ti.com, 
	rafael@kernel.org, robh@kernel.org, shawn.guo@linaro.org, 
	sudeep.holla@kernel.org, tglx@kernel.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 16, 2026 at 10:11=E2=80=AFAM Douglas Anderson <dianders@chromiu=
m.org> wrote:
>
> As talked about in the first patch in this series, passing NULL as the
> 'mssg' argument to mbox_send_message() ends up causing confusion and
> quirky behavior inside the mailbox core. Despite this, there are a
> number of drivers that pass NULL.
>
> It is plausible that some of the drivers passing NULL may have been
> taking advantage of the quirks of the mailbox core. Specifically, they
> may have been taking advantage that calling "tx_done" wasn't truly
> necessary for NULL messages (it was a noop) or that NULL messages were
> passed onto the mailbox controller right away without queuing.
>
> This series introduces a new API call: mbox_ring_doorbell(). The new
> API call tries to mimic the specific quirks that were helpful in the
> old behavior and it's expected to be a nearly drop-in replacement.
>
> There are some subtle differences between the new call and the old
> behavior, but it's expected that all of these differences are only for
> cases where the old behavior made little sense. The description of the
> first patch details these differences.
>
> The series attempts to convert all in-tree users to stop passing NULL
> for mssg. As per above, there are some slight differences in behavior.
> If any of the patches are causing problems, they can safely be
> reverted while debugging the problems. Eventually, all code should be
> converted over to stop passing NULL mssg.
>
> Changes in v3:
> - Suggest mbox_ring_doorbell in the warning message
> - Updated patch description based on Cristian's response.
>
> Changes in v2:
> - Instead of just documenting NULL, introduce a new function

In case any mailbox client API users want to comment, Jassi has
proposed an alternative to this series:

https://lore.kernel.org/r/20260310234616.334498-1-jassisinghbrar@gmail.com/

Feel free to join the conversation over there. :-)

-Doug

Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749E17E1
	for <imx@lists.linux.dev>; Mon, 16 Jun 2025 07:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750059073; cv=none; b=LQvDnBBnUG6+W7BCHLSTUNvHZBu9/AvTr9/IVrKsOhgvXyMfNConcLRN83DK3EOKhcUfnonU870XE/F5blyQmVh3kmQnus/O3Ty9vuSlpwEJqrt/lePZ/OO2rqrAEo03Pyy86FWIfapMkILfWRkwNCwqvxb8wXZ6xukoX3q+gC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750059073; c=relaxed/simple;
	bh=cheEarIyKVJUARXwRvLdgflVQA3knWwTd0Aeo5HkwRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JZSXd3sFcIF0E+43rmbRInUN9Km+ZQxP2Im1dHbGx7rMnqaJSJXnhRiCNnIYCNLT/+vCqfdOn0eosQxZL0QVIFNplXrOSNd9ih780Mvcs0bHIm4Mb8cE3dz3pPQ3Eh3gpOcH5S7Gw1jkEefweoqipGiKw/ms53t6lHfsdR8xocM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VAXvVf6I; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VAXvVf6I"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3122a63201bso3887849a91.0
        for <imx@lists.linux.dev>; Mon, 16 Jun 2025 00:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750059072; x=1750663872; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cheEarIyKVJUARXwRvLdgflVQA3knWwTd0Aeo5HkwRs=;
        b=VAXvVf6ICuKpq44CIb07O63ChhOdgI3uVe4OJgqw6P+NXx5hWUtwEzUIIZFnoMvC2S
         l8WI4JqdWKYO6opg/WwGKK91JduMRrj2RJ3i63fMiuFk6crLVRTX3JkSg6os+fex+DO5
         m3GcffiF2xrzad4X6LjUm+Q3T+4bGDa8vCYXaDy5YQYutOalYNIGuafYxszZTM9saZtu
         GNLyS3loQ2jGWIou99P016iHOpAyr7EBDERqJsPnKs+waWRDANj5eT5pOkUEqiMqRNtQ
         InlXjgp6zi9ud+2EtxVPs2eD1SigtnUwBtPqk13KDeJ6b85aEwiZ/ywa6ENDkxiqY7O2
         cQMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750059072; x=1750663872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cheEarIyKVJUARXwRvLdgflVQA3knWwTd0Aeo5HkwRs=;
        b=q2apZ5nZO8WdcmjMaovHyYTOtWmeAaN7F47dhnqjCi0TGFYSdu7MYQRUzc6YkkJ4dF
         8J0GQUq/d+I9/kIEVVmVQLS5BdNn8nGx0bBT0ohkzh1e061S6UBuhf2DoRDNIYAyUQyU
         SyfoBZ8F0XUgkYiOQW+oK2WYwcISumfXKhIrtGUK66kW3MVJF/GULI4FWHKBAmb3Lxfa
         8x4tMZoBfxTLuY0kW4NLkSLJ8PQTiHm9oxBlYywGIKUllSYwM/ZpBmxUzSzrIbUWHcI8
         51+em0IiMMTvxkWXotiM5483QvtPIrJvhVyEyFiPJx2otiGzxMqS92Wso/lWCVLRG9qJ
         MyUA==
X-Forwarded-Encrypted: i=1; AJvYcCWFKlmyyGekG3abgVUEfVxtJI0TFmMpIj2pJMlPQvBMlGJWZqGpodg9sBF2wSt/xyHjYGU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3K93HZ4oo4+gy2yh+VUls3AHdzRhYCdH9SRtC2DrtiuGTS5G3
	AnY9COp+ugLddmeIq279ojL67wtg0WEsnX/e3I39vKKQNQHePVN0xh9SuubVr038s44vemsHpW/
	qbI8K/guTMZtg5Gh5TrRAysLFYWKXciQ=
X-Gm-Gg: ASbGnctukoK9jXXGVpxYpNm/OgP5yMe8q3X9Zf7Gf/9LZ5qNQiT/OMsi5ZKgDFwPzn5
	72sNKq/Qf9qwS+xQcCQVWuvCNqIY4o4O6KxBnhTq41YbNu/P72L6q50KAbn+xoj/86RkR3ewJYA
	+zBb/9NOh41Sjr06JKamcm8J9S1EzQwgrL7BIEfYjm
X-Google-Smtp-Source: AGHT+IFAqYUd3QpiI+ATQMIggtddyd5pZ5byJDm+wKZp9c0vvh4+WvPZLenvvopWZ+I4insDVZLiVfMwAJbeqfnmCkc=
X-Received: by 2002:a17:90a:c107:b0:311:fc8b:31b5 with SMTP id
 98e67ed59e1d1-313f1ca1398mr15200699a91.14.1750059071687; Mon, 16 Jun 2025
 00:31:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250613194310.1128733-1-laurentiumihalcea111@gmail.com>
In-Reply-To: <20250613194310.1128733-1-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 16 Jun 2025 10:33:13 +0300
X-Gm-Features: AX0GCFtn0hwbvtz7t5if-ZTv1RrgsBJVVoHPdrySbGFc57a2cboCkTDRMjfm2ao
Message-ID: <CAEnQRZBHF4dwTEcaz2VQE9UYCu9aVapV4fuRtTXhvBdDDkZDWg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: SOF: imx8: add core shutdown operation for imx8/imx8x
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 10:43=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Currently, the DSP core from i.MX8QM/i.MX8QXP is able to operate while th=
e
> firmware image is being loaded. Because of this, the DSP may change the
> content of the firmware data just after it was loaded, thus leading to th=
e
> data having unexpected values when the DSP is reset (via run()).
>
> Fix this by implementing the core_shutdown() operation that will put the
> DSP in stall during suspend(). The stall will be removed during the run()
> opertion, thus guaranteeing that the DSP core will not be able to run
> while the firmware image is being loaded.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

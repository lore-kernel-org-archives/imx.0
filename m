Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F055149E13
	for <imx@lists.linux.dev>; Tue, 24 Sep 2024 11:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727175630; cv=none; b=Nk2FuvjUhugp3Do8vPSUyxsmNPbWV27BhvMhqpshu15NpEljjlO6pQixCFU6SJDq2KBd6tHrBN6hf0gMN527qo/WK18IFod05xFZBQXs0CPIpJzJfsc5fJ//qGx0p2UwlYdGUJJSXliJI+XkFNfrAkGTpmSkSRbf6nIUrZA8cSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727175630; c=relaxed/simple;
	bh=GbmWYbVrXDqfcKXu40KvK679jdBRGxlxANqdEUUoGXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QT4gFgkbNBIEyTQu5owIW8QgWqIsktP99G1KbkOYZXRefzJx6bBRCj3TJT39nCrod8J1nJGCI1WPJVe3sE+W0JD+7rdiCCBDn0/F1lkgyA7BmTyCjR1orhHkGTSaWrFcDR610FzZLqQ9NU7B756dQq/xYlzlbwkVTdoPRXK01bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XHiUR6jG; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XHiUR6jG"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a8a789c4fc5so196459066b.0
        for <imx@lists.linux.dev>; Tue, 24 Sep 2024 04:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727175627; x=1727780427; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GbmWYbVrXDqfcKXu40KvK679jdBRGxlxANqdEUUoGXw=;
        b=XHiUR6jGdTHnnhT4hpnYRhdymu6w9w8+BbnT+YUz5AmIxT5le8ECKf4rFRSwiGw+Ly
         66sn9o0rcSbcaShXF8lqTUmpN7DbrjFSLSXmCjnkqDbf0S/25wle4IgaTQHznXIbqjlO
         +Hd5dXj9GZ+kcIm2oeZoYKGVCn6qPdm8uTh0T6mJkTeFuw92VNkZzu8z0r+Qx8CgXx2d
         g/VfldagWDB1Fq2tUbm27vsG4Yu0k6aW0BeeEvH4ZdpQlhBYTujqQjMJhTLvA2heKEH8
         6fXakdOwieUs5xX/blNeZDQa6ANwUGAthzBJtgfH8XUwV9vbo3w6dxO0s6PObqAU5++T
         yYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727175627; x=1727780427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GbmWYbVrXDqfcKXu40KvK679jdBRGxlxANqdEUUoGXw=;
        b=bpdLBSsWk03+WccvEKDWZqd7WyM1B+w0iaCL55MnYUHh5vqZn6086q12pVXmV3mBYy
         cLv5/MfB8TeV8lePfC/kV02gsqWr49xP+JZX41Whf//0qhCL/sN25DSKebERT26JNnGz
         rf0UEmfYHczcQDAAhSZT7x9sTINabogcnLrUnEu0fHbXLh5xfHQyrFJ7zcVvEpOQdjMb
         QiuCoJqww2218+nyH8Z2q1t6ND9YjjRRfxhBWZoi5Dexn3oJ+nnsrJZOtnhxUZXiE+DJ
         G4FrxbcGrg3SiwJzQIhp8Y/Ke78AYT46PDqtVKpN8w1nw7KogvmerI/D7t3ksL2iMG0p
         R/qw==
X-Forwarded-Encrypted: i=1; AJvYcCVSy4TtZZiztdPl5N7OLR+G7DvN5nx9hkw+bPDv15UIozJA8DgqWtbdzf8OFkna2ih4UAE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzeoYEa45PIlTZZyGw87mqpAKlC+2Qc64Rxmh+WAT+MrL7h46KV
	KUpvZ40HpgoagoPmOD8Y8tszo5ibO6R2YtimTrCueBWdpDwOLDCz3Ano69XNEVyhdb2ya+UlTet
	wmNhxlTcyuJGB8GiXGKpYCUT+XTc=
X-Google-Smtp-Source: AGHT+IHuqCHZSGsKafDZKaGLwyJCG2HLKGG4gjq97V9usBaBNmiBz/4O+Luf8Md/RJg13H0HZ247pfcLB0mwwuTcf/I=
X-Received: by 2002:a17:907:9447:b0:a90:c4a0:9b17 with SMTP id
 a640c23a62f3a-a92c4810ee5mr311312066b.9.1727175627157; Tue, 24 Sep 2024
 04:00:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240918182117.86221-1-laurentiumihalcea111@gmail.com>
 <20240918182117.86221-3-laurentiumihalcea111@gmail.com> <ZusjwTdf90J3BMH/@lizhi-Precision-Tower-5810>
In-Reply-To: <ZusjwTdf90J3BMH/@lizhi-Precision-Tower-5810>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 24 Sep 2024 14:01:26 +0300
Message-ID: <CAEnQRZAdKdZbOgqBJbpLbfjtpwPt8qvR-hJkduuuw9hrwd5Phg@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm64: dts: imx8qxp: configure dsp node for rproc usage
To: Frank Li <Frank.li@nxp.com>
Cc: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 18, 2024 at 10:02=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Wed, Sep 18, 2024 at 02:21:14PM -0400, Laurentiu Mihalcea wrote:
> > From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> >
> > Currently, the dsp node is configured for SOF usage, which
> > is not the "default" case and should be done in a separate
> > SOF DTS. As such, configure the dsp node for rproc usage,
> > which is the "default" case.
>
> why do you think SOF is not "default" case? where sof dts?

SOF DTS are yet to be upstreamed. We use the DSP for several usescases.

1) General applications using the DSP using remoteproc/rpmsg interface.
2) Sound Open Firmware.

We would like to have 1) as a default this implies that Audio is done
via default
ALSA path.

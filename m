Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CE41C3D
	for <imx@lists.linux.dev>; Tue, 24 Sep 2024 11:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727176733; cv=none; b=ZLZNP5pE84zac70l7iQfoYpfEEC02tsVZxImpUJN2s9VAlmCF7T2slMLGGdLg1qxxjl08P2lNNHweDubKMTLdsB6Qj10yBg6lGYz3wzpOH3gdDZTFBcR/0H1RlLrnN3QAMx4bEAn3hPbmHgVtRq5ivPD7u7+4E1SxdbJS0Du4V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727176733; c=relaxed/simple;
	bh=YBAqfCr1rPGxWzSzMR4p/L3+lR7/ASXO7LooTM0/hqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m50LHyyS0BAAXoh9wAQB4kCrL9wPOKlkzn4HqBQEUSGQ8h8bmiQASwRWui2esl++IArgEgGuq0p1KSA1NQ/Q9eLJcWFdS1vH6YL6v7Gi2LwsmNP+5/8BtQws4SutA2yAFs9C0hoe2qMxY3QPd0HpnZFVyW9O8eAHNk1VvQGaVQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L6tnmTdh; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6tnmTdh"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e201f146cc8so4915916276.3
        for <imx@lists.linux.dev>; Tue, 24 Sep 2024 04:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727176731; x=1727781531; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YBAqfCr1rPGxWzSzMR4p/L3+lR7/ASXO7LooTM0/hqA=;
        b=L6tnmTdh1KQ2z9wqm8w+LQPbZID7hyFH1lzeL1G0XqZBEEZXKybGCpmxrb7Y3gz9HL
         HZU9I+lCXhit7ubP3UAFZUxgsvgsTpfKgivebmax0ytyH1A0iftn5HCXKkLY6IRUHm66
         csONZczVSND3ENagqizZEWJRL7YGv7joKEa1LkGeTRFz7LrK6dKRwR4vOD+qL1tzLU69
         QMoDbcCZ2CR3579cWoSgKnoO8jAHb2K1nEV9MdTyBOnyDpezJaADxc4UKYpd90ykmfKG
         5jJxq1Ys4/reNgZGf/rqRmEd3s0okh048iYZNWg+LPY9RHjevBMgCGGE5rBRMj8tZz/G
         4zVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727176731; x=1727781531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YBAqfCr1rPGxWzSzMR4p/L3+lR7/ASXO7LooTM0/hqA=;
        b=BTRWejQTyZwIwGYe35yFU63QT6LzGSb01fqec7K5XaOzSLM+YlR+/hOYnHyDyyCdwT
         T8qTpZJfxz/GLz68jtwqvHl775Rmm+YrItdg4WvBse2271jk1yIxedfGzKeIeGXwm+ZG
         DSaWEOpwDGzLpMq6lbF7eMG8VLmuKUEgIlyfd2I/AOIYLeCiOB6H24VQqoTFxHPxUSUH
         JYEMChR/Xt9TwIgB1VCW8Dc97ffFcmutVsJM1TpHNrmzhlwVxmq+5sQpqvj3mTGyt9Cx
         9JB3p16J7GgIyLss2boxE2hMAEsDjOq1ZuG1xan9bRcNCYAXRBRvYF6z3/Q/0YWVZu9w
         D61A==
X-Forwarded-Encrypted: i=1; AJvYcCWd6gbOeqGkSVKurCcODfTifSsKqiAv/5+T/93bDGs0k2EisZwrqhsVoXeAGw8OEnmhtxA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQJZglgjHs0HHc5zlVD9Rs7K9vqMlYvcYZ5ng7zTthwHEnoIfH
	fxK+81AQ3e/3y5zGJeFNnTOWIwgKlP06beqb1CSBug9FRzVFTR/pv3H1v6JEW9/4AeR0TPUq8q6
	adpjoGLby4V9FkEb6oAhVH8Kebf4=
X-Google-Smtp-Source: AGHT+IHANp7+/BMwt988SLqyFK4IXfD9/zYPo0ZjUxhHBAeaZYv3Ys8UDFEPSo4JAjl/rljyKlox04YLEYQzEDwc4rk=
X-Received: by 2002:a05:6902:2b91:b0:e1a:72e9:b243 with SMTP id
 3f1490d57ef6-e2250c24a2cmr8718542276.9.1727176731047; Tue, 24 Sep 2024
 04:18:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240915114311.75496-1-laurentiu.mihalcea@nxp.com>
 <20240915114311.75496-3-laurentiu.mihalcea@nxp.com> <CAOMZO5DR7xaEGj9=mzzFPy6wB0z7-SmvXkMnFH-wSjs01hp=WQ@mail.gmail.com>
In-Reply-To: <CAOMZO5DR7xaEGj9=mzzFPy6wB0z7-SmvXkMnFH-wSjs01hp=WQ@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 24 Sep 2024 08:18:38 -0300
Message-ID: <CAOMZO5Cacne=7ZYQ3eSdO2RRd+QuPurziFN+mS_KU7kucXHBQA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] reset: add driver for imx8ulp SIM reset controller
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Liu Ying <victor.liu@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 8:16=E2=80=AFAM Fabio Estevam <festevam@gmail.com> =
wrote:

> Who is the original author?
>
> In the NXP kernel, the author is Liu Ying.
>
> If that's still the case the Author field should contain Liu Ying's name.
>
> Please double-check.

Also, even if you are the author, there is still something wrong
as reported by checkpatch:

WARNING: From:/Signed-off-by: email address mismatch: 'From: Laurentiu
Mihalcea <laurentiumihalcea111@gmail.com>' !=3D 'Signed-off-by:
Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>'

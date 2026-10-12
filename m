Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8412946F4A1
	for <imx@lists.linux.dev>; Mon, 12 Oct 2026 09:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797958; cv=pass; b=NoV0ACZy8O3ee7DbG7AOqALM8m/XiJOmdkTUfYSZDnZj5f0mzbNPbbUSWh509P+A4OqedI4Mf8rA2alxpxclvZySG7IEx0WZd/Ky/r3Nm0tyvBeC1O2qbjToVkgwm3qPJEmVcYn9yBomidxrXZUDNpon+Gs0HxOgS2N+f2q8+jQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797958; c=relaxed/simple;
	bh=xctuaA4PulzCyQhRxtqWpMmwfC55/Ln+sQuojgXBfss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eMl/C33kKyFCK8qhXu7f+3/K0obn+BtBjbWDrpSWN6C/LC1sTa6wlyq3uhrv13zQF4Ophyf5nabGC41maNPbxyxdWo7O6HraPwMLAol0g1RZNUGsUv3H1SeH/rX25uJrg2m0VBSsLVw3SrLj7bTYoosRxoc3VGguc6P9mG692Ck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IsMzjypu; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IsMzjypu"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a98fcbfb1dso11948491fa.1
        for <imx@lists.linux.dev>; Mon, 12 Oct 2026 02:39:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791797955; cv=none;
        d=google.com; s=arc-20260327;
        b=XZeKQwYDfJIRIVbbfWneCRVDJ02ATqkhkFtqZ1cP9Am4FBdHSSFp8A2SXraqAhEAzl
         Dc4hwLGZ9mO6AFrF9cuZ+wFcuNckSnVgY0POoW/IFJTPYf4H9Ssss10rT/Mhtqjw6Irc
         lzlssc31n2S6pevn6IrfNr+KdUOO8RoCuzk7vyGc3KYy+iVtWyWIaYtCGrAhBkOyhGT4
         Kdme+rm1TQxFb88yPFsU7QLYY4DxpQ0uyQ0qQgkbjmpg2uJ29Ci0LHosg/n6cL73imjy
         m2C6x+5EfJqRamP5Of8ErPghpJluLN315eG5gcwt7/MKD2vH9fNPB/t8QEajcSS4bqvO
         uKaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xctuaA4PulzCyQhRxtqWpMmwfC55/Ln+sQuojgXBfss=;
        fh=bp7IRdHntiExTmH+oIWmUj2M2su6dsCd13buo8t5OvU=;
        b=k2sg59HOzAnog6ebTUV7ywL0wXLTGFBw8yN5cK75lk/kDm2TKb18uvU3MUa8lbyT4Y
         sURKHHXQgb7O0CZtcUGOBrnzB7Ucv63UpFVoy14z9SF4gzIb2bUGns6jhYNVvbAOv7MV
         NnpZqg04FxHV/WBAFJM8OGzjLm6SM9BfKEIylT1d21BHfpoIv3jdP/Sq428nVDaWJmL9
         ys4RBsH1DlCalgKarJeTKC2sAkGqc7HJy9PjlYT86mXpWS4MRXacCwIqPBzW9kDkVAWH
         yaDFieVUXQHtOc299HhqD2a3cgNWE98Xung3oF84lfvGsBrajd3wxkXmrs4oBsYWfC6a
         6NJg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791797955; x=1792402755; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xctuaA4PulzCyQhRxtqWpMmwfC55/Ln+sQuojgXBfss=;
        b=IsMzjypupi/4dmYj5oaPGFlzw4lmu458HMFj14jGKhsMe8XmgpTOvsROb6bjkRVGTz
         9MjZbfwCcCKjejyWrvU004XbN/AfcTJ36bPBWDfxT8QNA5Eoh6FC62lCE1VWD+Xy+NHV
         FALU+1+uBO1PFhixjjuLvL9su7OygcuQcHz9BgF3lYmPDZhEUnWZMw8pDv56tQhTxawD
         2gEXifjmayBLIcTwS8ssm209Tem86CFwzbqUdW5KD33/JwcrEpCM6XBKMqvrwMtg46zN
         UK/dmQqp7yZSNFzKPT5FdoqqgkzZl9KK+5No0AcglJ5r+OES/BZIKatYU7rF5Zj8gbNy
         4dXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797955; x=1792402755;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xctuaA4PulzCyQhRxtqWpMmwfC55/Ln+sQuojgXBfss=;
        b=rbXXOwhxKsj93P0JkaoUKCritJ9DkprBKNsKNuqcGqWdwEsRY168RTRexWINGmRocB
         P9nIZxSLoGk+YiymwP6G6DebYo4v3d6Ah0qsi6ntBi00c3p2lksbSH3p47hMFAxIbMve
         QDjCoB1pVKiOkZHk6bVEKhfm/+ufxin/OZvASS0HcEDWqN1bIUfgTBQRrhp1SDYONA6X
         eXEfuYAFMDFSb6/6z5B5qepJnkTCXb6naV+JiT9poJVHOjZfN3VP54BTQtDz6ezAff5R
         ID7l/Xf5OnKmMFK0oH0ktDPcncNFehp0BL61xDtn4nQHd9FLhjqQGC2OYBbtqSqQAFYG
         mmyw==
X-Forwarded-Encrypted: i=1; AKwUvBzyum9pIDNIX+qCtaKPkZBmlghKrWpuOfM0UbYeLo69iv0W9mk7aO9q4uMUXNjWBHoejhc=@lists.linux.dev
X-Gm-Message-State: AFq9FYIi/lumc04AeP1AjPKbMKDmg7PHrqV0I4YJ4/yHJbWF+IjnFu+C
	IclasXIwMD+BIAuUlf/0PRWhQT6MW4K0oqYkvdEpylyyNW4gN7i+EggxjAWn1hDeha0eMdqoOnZ
	2R8hKMhvm60nSLw6rKNO/xCsMvd1waeQ=
X-Gm-Gg: AYBFou23Lz/hBox1f/Kay2F4Nf8INa+PZGH0mugTyukyzWSp8jWVaWLl8EEeetiuWvz
	xgA4sz0cY4RNd2Zx4pxHx0I8ak3sfw3rTTKBpgYVeUKh5yQJtFv68/kZo5ku66v9LqxPYYwnJx6
	9D8QGceMxMEpaCVojQr3C4LwrUqctoFXxwau0HS6zkdxU+5au0sNA5liel5aposlgl0uq0hRmXo
	QbU2vEEjhWoLTHarTj4mgmdGxEP9I4uzic6BvLyW0dzu/W0B5QNhkQZ8c0LPOh+hDiwFIfIOwck
	1v+p9zdqF50l7gEkWieoy6A1RcuT9pg+hL8bcRtfAX8TorUk6XrXbRnaIE+VSqNf9gRERtKmETk
	LwOsGXihfqg6UmmGxOBRpXJn5KD/7zRn6PeDHQpQhF2+VgSe8qTkx8afExuMpVK/AbSC5imwBWm
	od/RTG/Vvu3Q8HbdEg3Z0+mJpGeJmtJ8yeu7RIAIk4
X-Received: by 2002:a2e:a58b:0:b0:3a3:7681:6d5b with SMTP id
 38308e7fff4ca-3a9c53852a5mr24148381fa.19.1791797955285; Mon, 12 Oct 2026
 02:39:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com> <20261011-gpio-mxc-cleanup-v6-9-cb47ce2ad758@nxp.com>
In-Reply-To: <20261011-gpio-mxc-cleanup-v6-9-cb47ce2ad758@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 12:38:37 +0300
X-Gm-Features: AclHuK-Z5wvwMJRFMQw1kYvrinOCHaZjgXVZjShRyJvcSKeeEwPjXo7VOTJgmQg
Message-ID: <CAHp75VcktnQVpqLADs5AccUj6U7KLjAatPaSzMX8SXDrbbs6Ng@mail.gmail.com>
Subject: Re: [PATCH v6 09/13] gpio: mxc: use cleanup guard for
 pm_runtime_get_noresume() balance
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> pm_runtime_get_noresume() in probe must be balanced by
> pm_runtime_put_noidle() on error paths, or pm_runtime_put_autosuspend()
> on success. devm_pm_runtime_get_noresume() cannot be used here because
> its devres action (pm_runtime_put_noidle()) would fire on unbind in
> addition to the success-path pm_runtime_put_autosuspend(), causing a
> usage counter underflow.
>
> Use a __free guard to automatically call pm_runtime_put_noidle() on
> error paths, and disarm it with no_free_ptr() before the success-path
> pm_runtime_put_autosuspend().

...

> +DEFINE_FREE(pm_runtime_put_noidle, struct device *, if (_T) pm_runtime_p=
ut_noidle(_T))

Please, split this to a separate patch and move it directly to pm_runtime.h=
.

--=20
With Best Regards,
Andy Shevchenko

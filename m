Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3FE35676A
	for <imx@lists.linux.dev>; Sat,  3 Oct 2026 17:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050105; cv=pass; b=cdXoyD4EQAqEHizO8OBqsvykjyp/mTCNW9hZ04gOa+ov5hSYt7JxXPUlxw4Krg+cnJaW6kxY+lh7Vc0oNpqCCPKK+IEdkW7TwMQcXGsIU+Rbp9kWzEyBNNxdUOha1NhJNwFvgXgKJJpItxiIR45bxBkcmTX1eZT6J+M43VwPxI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050105; c=relaxed/simple;
	bh=c+Mqd6Pqbqln8HeOp8rCuqd0Rbs7qUX/fnfxIBh4nMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ddwSRNpAe7vDZzzHp2RUHgPkvyfg6/e8HXSGCbTqdBhQB6tkqHyeIPaYClDLFkHot1O3BUyy7oBDF3JQdLGMrz6VJ+eHVmAtf0+2men1CzxxjMJTXoCfj7wcOq+V5qR/2pFS92V9/C+FbfMF+nTr1yrH8oA0QE8z4nHEJlgbUo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ykmwbd3G; arc=pass smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ykmwbd3G"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e0b486d91so128145066b.2
        for <imx@lists.linux.dev>; Sat, 03 Oct 2026 10:55:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791050102; cv=none;
        d=google.com; s=arc-20260327;
        b=LKnVbzmNZALlsD9OMlljR3DAVuYNPlZd8L8TriBhQco67BOFHFUWGnz+4lKW+/mKr2
         aZYuygNQyvZkYQZGcSbVDKJmOlLsTsrmcesyxRanuLFy2yfWtZbIDwOj0DMeD9uo3ROx
         GnGjwIojGiI/U1yMaBdMrqUqGtgJA4Ho86/n/QpKEkVA7ESG85rdlnTBGAma1ZKKIt/k
         6qjMalm3KUDXQzqHjdlNiFp4LK1yK4VGd/Sk+ytjhSSQy615ajjakb+wbTStb39cplzu
         7CjyPycuQZWNR8UaAkG99UhPRcVxCJ68UBbqKi7XWta6EageNe14Qw/udkWCNHoS6UWO
         PZbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c+Mqd6Pqbqln8HeOp8rCuqd0Rbs7qUX/fnfxIBh4nMs=;
        fh=YNa/5SeNx3d+9JKHmRo8yyTRQEJxuRoFM3Q/x1XI6z8=;
        b=Pxwh3SdVtfuBRfFbzRBADokV3GJswd5s0lxY2mZSfzct9VKVazJFud1c7kiISxWSmq
         FZDaiunxSqNCcCTltmMZ+vYqYf/jNWLPk9e4+rME/JkWexOkDc5U/A+/+iMllAOhBRoQ
         8uRjWEcOgC7D5HSZVvrjZPN0/oH+i09PaooezyRyuFTQ1qEdsxQLbUkXT6Vz/vyjJ95J
         YJ3nKtpO/2UUopWVsQuJitQUEitj/yqbZlw9spYDRxK/vg99fvOwsrhNvIT2gW/C3ush
         pG5OUWQYv/jT6R8LECIUD3dLeCXjRJSHgVMgicU8CW/3qYZb2gkkgUEpswD/RJM72VvO
         TYqA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791050102; x=1791654902; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c+Mqd6Pqbqln8HeOp8rCuqd0Rbs7qUX/fnfxIBh4nMs=;
        b=Ykmwbd3G7P6voTbqH0bGz+s4hsGSjPofGgb4/t1VBj441EaK5Tc2OxECBwn++9Ab7U
         9sVo8jJiVH34tl5IxNsaVFvSk//JyYkzXHyLLXFkFCxs92idOxRvvpyofF8y1fZyB8k9
         4PRr0o06TNZglNZw1REpre9K7AhkuCmi8VqIQ3sDKb9LWVSjJR2eWr4puw/TcKwgW/EG
         47oo2euX3oL9KbtnMrwY0isXydY00iKLxl5SkYJl0V29naaf4ZrfTedo14q14ywn1DKU
         7XnChjDLrY3Pl5+oYjk08Z+hFDmq6YbiuMz/tMx605dwNiiW5C6ii3koCbvEKVUNjoOl
         hVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791050102; x=1791654902;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c+Mqd6Pqbqln8HeOp8rCuqd0Rbs7qUX/fnfxIBh4nMs=;
        b=G6w7Ob0EXwtQsY3Qmc5XmhCN7LTQx4utdb9Zcz3LGcP3kybGTFvYFYmJEJGmpLqW3J
         BhrYAd6F/NnkYlJh5CYV8vP059rKlZqY6hzMQEEu60sihuYRjS9Uzodd+CDcFuf7VYjw
         XYBbzY/YSF8Hgcek3rTrftiF7IiPT1YfhfZQ5EEX4cwk1JdhszONOWtzamQoDo9Nw9XC
         v10+3FJiKo5r/exrXN17eeVcLN2uwshnOo9Cf2QtKv7r1+but0IYLyfnlbYX9DUP+cjz
         q2I4ER2DakTPWnKB0M6UZwoIrIcc/XZInpNyaVwIXA7Jqbma7imiLLk4wcgAxIU3hHQv
         /Z2g==
X-Forwarded-Encrypted: i=1; AKwUvBx0BLknPZk3Kksai8NsdxW/rgCnJX9btxjVWYwAnwka19JXGBgXzuma/yj5kajzHnxuJCw=@lists.linux.dev
X-Gm-Message-State: AFuF++m/A+bUfuPAn2WOh8TNNs+lrbzAlrBBaXEu51y0JVR72k9Px2yU
	xgfV2vx1cd+5K4RnotCIKfkkbh3IoFnRjoAe8GbczpHbyfLlLJrH5qYByfUZJdQ/snPGOPBkXV8
	wjrBnNpZDi0FsFY+qPPx1Wf+4Dy0ndSkXXqcXhQY=
X-Gm-Gg: AYBFou3EMCT6wjleLRyXf14qrjK/nPNAut7Du+UIn9vrmHN9JW3tFyyeLDKSydGzcF8
	QthiP6O1CZSeie+6qAByJO7PZwy+gILBGw76ADMi11mbawlSlXmfEnsahamzC0f79yIxvkAOEzw
	JBrPerifvnnByTPY1IpuNCkKO8fQ5Y+W4bcTr40dsjD7ttgjRQHh8q6uGrJhBEeasxM8+9pNMmx
	rOTuc/2P+RlrYTC1iQM+FpZa/nr/58TE0ZKeBBn+PviugLWNLBo1YVeNqUAFVyS+oyIqqrKMRmh
	CSe2hgzbL/KA+5Qvpqk8w3reLmKTOdOWsh13XRx8r9Ea9xYA4wOTn5HyUsVZC49Sk346Gs0RBxu
	ry/3ruZCbs4n+dgyo2XVHQdTt5kRB2bXs5TMSV+uO5wJ1O/cbT5NPV+f8zjQusCmH5va51d58zZ
	2cWvjd3PUJ23MpF39FFCSIkVMbVHcL6Wgqp/c7BDmwqw/Z6XdvaNti
X-Received: by 2002:a17:907:7fa8:b0:c2e:4292:d26b with SMTP id
 a640c23a62f3a-c2e4aac022dmr541503866b.17.1791050102486; Sat, 03 Oct 2026
 10:55:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com> <20261003-gpio-mxc-cleanup-v1-6-dad728ce27f2@nxp.com>
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-6-dad728ce27f2@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 3 Oct 2026 20:54:25 +0300
X-Gm-Features: AclHuK-Tnk4vGYGovhYsTrmL0EszXMNMJq3_DIUiup98Oar2sN_FwV71aRE1nR0
Message-ID: <CAHp75VfcuHPQ3S4LD6OBAMvu=hiGdSU_pji9+8LAGXD=y4C=9A@mail.gmail.com>
Subject: Re: [PATCH 6/9] gpio: mxc: use local dev variable and device_is_compatible()
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 3:10=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Introduce a local 'struct device *dev' variable to replace repeated
> '&pdev->dev' dereferences throughout mxc_gpio_probe(), improving
> readability.
>
> Switch from of_device_is_compatible(np, ...) to the device-model
> device_is_compatible(dev, ...) API which works with both DT and ACPI
> firmware backends. The 'np' variable is retained for
> of_alias_get_id() which has no device-model equivalent.
>
> No functional change.

> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -428,17 +428,18 @@ static int mxc_gpio_probe(struct platform_device *p=
dev)

It seems you missed updating the headers (like switching from of.h to
property.h). Other than that, it looks good.

--=20
With Best Regards,
Andy Shevchenko

Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977C38F4A
	for <imx@lists.linux.dev>; Tue,  8 Nov 2022 10:24:56 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id i21so21715332edj.10
        for <imx@lists.linux.dev>; Tue, 08 Nov 2022 02:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3U9H2oDYo0jHZ5n7VD9WQgIXQHftQXj5Rvrab9Xb/3M=;
        b=FoICTrB0HokDj9Jr/RWi2HeiYU3xlqoZr/QJxMZBhg5PgaXUia0hn4SzasJunwTCQi
         a59ynF8QExOW/dv2VvDEGzEJ+4nEy2fmWW/CIKkF++Rvlh7B0mkvjIvBQ5UQ/+ZBVwLq
         0en6zt2YjQxJqsexkTC9HaxD5t5dEhp9BBx4GBInvt0LzgIBuIMZUp0NhP4czatc80P5
         ZnRfaPTyQkiWEBBkoVxs8b8umWvE1hkQpZzlqNQQzBa8n9YllreQs1gCq1gaEyXol0SY
         4gI2NFkG/zwVc7S4pTrIk/eoPajcxNRH3YCJnxzdgBggAUUMmopZOn4+5qm3/I4g2i6p
         0lpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3U9H2oDYo0jHZ5n7VD9WQgIXQHftQXj5Rvrab9Xb/3M=;
        b=By87WrJt3Bx6NDhZoRH9fgS0ZjfGzRjtFL3RFfRLWj5O9j3xd/zn9IyKS826v3FdUW
         ybxvMGSwUeCfvE7PB65qGcdbHIiyUUbZUYyvvrLFVC4DgVEdGGXfvk/+sPKOYuxSozDZ
         DjDOB1yiyMM+v8eMlHFsH2w2SRmVE7NEABwhNZo9A//6zp5mCwXQ+BgzpxmRqDz8bPWz
         cWQtn+PN/ruOIr/b6REx8yhBgAQXgsMhsaxKh32OImuOjHamqPkKzuWUlDwhoPsmbSXm
         ySYrHLXOOZim+/DnsCrNYOD1Q7F2rVUMvd48xyHVZ5xsid63q3GfK1sqBmBYuI368b0E
         10xA==
X-Gm-Message-State: ACrzQf3fxZsU64JIMeW2hCl4lBUZT6Rg7TTGHxEBrvxFLszH3NMkmpwY
	QHh9HAiPEA6ekN8KPv0Kt91PfMHz+w1FPov59eHePA==
X-Google-Smtp-Source: AMsMyM4+kmlt812NqsehPqTcJthwr/1SzuUus2LC5jb9udkKVf+AcR8z9rgNjpkcnZ+q75/1Cp00Q60NPGoskvtIQ5Q=
X-Received: by 2002:aa7:d6d1:0:b0:463:ba50:e574 with SMTP id
 x17-20020aa7d6d1000000b00463ba50e574mr37142535edr.158.1667903094898; Tue, 08
 Nov 2022 02:24:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221027130859.1444412-1-shenwei.wang@nxp.com> <20221027130859.1444412-3-shenwei.wang@nxp.com>
In-Reply-To: <20221027130859.1444412-3-shenwei.wang@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 8 Nov 2022 11:24:43 +0100
Message-ID: <CACRpkdY5Eu6gb+nsw6Teg21C7PVUUKB8vpvPE_0y_qmqyK6_CQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] arm64: dts: imx8qm-ss-lsio: add gpio-ranges property
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 27, 2022 at 3:09 PM Shenwei Wang <shenwei.wang@nxp.com> wrote:

> add gpio-ranges property for imx8qm soc.
>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Please put this into the i.MX SoC tree.

(If that doesn't work tell me and I can queue it in the pinctrl tree)

Yours,
Linus Walleij

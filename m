Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E082442A
	for <imx@lists.linux.dev>; Tue,  4 Oct 2022 21:27:46 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id u21so8569732pfc.13
        for <imx@lists.linux.dev>; Tue, 04 Oct 2022 14:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=3VFr5OP2d6ygeFDGeEC4VzTwLct6Eu3GUxTvgi6DA4Y=;
        b=TdZC5qmT7VzpeMCBC0Yj60M8wtuGHz3It6CUlaM1hSF6maGr91wsVkqZluGIipVBSG
         CPI6yrRr7UD2uuOxpHUmt2iaaOmxF8IPH5SgkQbp+nto7IRPUNByCh37CzSpeqsizmyZ
         0012tspDelv0TJDP0oiZ2q1rtyAeVPMleMA1zyTr7JutGkjAWt5TGCY9kDNCmIWG1cG+
         ueyQn7ZpLpLJj7rU7PG0MTrRboH99ylUagU1tEXdPXJ4c0Y42OMF+XSFwlVprGhNUeOo
         rkVcAulwEhtNIqHrKsB7yjCxT3RQwIRsGSLeD2UZ6DPySw6e1L0bU7ObhnYNXTtkzoHM
         fMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=3VFr5OP2d6ygeFDGeEC4VzTwLct6Eu3GUxTvgi6DA4Y=;
        b=h1CS26F6ymFaBhX/+pEb7RrkG6pAcJ7VDN37gtc/9qTrcA/yCN96pqhgG6lgOEinT6
         WXlu/8z9TX5nL0nLho6fx3KmvP1FYJ6I/sNyBq5yRdIYG68drqlt2ngs1SYZhvHYNEQb
         7Kl6VoQXt1Wmw/m4YI+n2FD+YDGpL2YiyToCZSs3eKPzL6GQ/e8H/Rr6Nm+CwdPgftxr
         T7XofRzNoGTdaEejk5TPVh3WNu4cnUdtgNkTSwR3mS3KU6g8tTxxxfskzwMGnlcwX0nz
         Jk9+h4bOx65sIiWIc2OqAQ+YsBjuL+MctKtHK8Fr/S3C257NQ82VN1oS12Zzalrunqus
         UmOA==
X-Gm-Message-State: ACrzQf0tSz2I0r2l/6toS9dSztgx9Wx8jaWa/ft2gvxH0xntQe0Xh+iC
	Xu2XErH9ibh2RPGPirXDEYqQKdISbXKkg052BHQ=
X-Google-Smtp-Source: AMsMyM5beCcApJovOPEuUcl9v/fyKqLDZbYIlEjt5FLGSLTwDEL6p7MhW4XeVniUb8HOiJmXGX31aJB78IdSUfF1I4I=
X-Received: by 2002:a63:555e:0:b0:43c:4f2e:dd25 with SMTP id
 f30-20020a63555e000000b0043c4f2edd25mr25548847pgm.131.1664918865587; Tue, 04
 Oct 2022 14:27:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221004202414.216577-1-Frank.Li@nxp.com>
In-Reply-To: <20221004202414.216577-1-Frank.Li@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 4 Oct 2022 18:27:32 -0300
Message-ID: <CAOMZO5DAjszTX9OSxbi8Bth7rB1kee7TWfDBz48SHRp9TNL0mg@mail.gmail.com>
Subject: Re: [PATCH 1/1] irqchip: irq-imx-mu-msi: fixed wrong register offset
 for 8ulp
To: Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, 
	"open list:IRQCHIP DRIVERS" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, colin.i.king@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Frank,

On Tue, Oct 4, 2022 at 5:24 PM Frank Li <Frank.Li@nxp.com> wrote:
>
> Offset 0x124 should be IMX_MU_TSR, not IMX_MU_GSR
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

You missed passing Reported-by and Fixes tag.

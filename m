Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B1D15B6
	for <imx@lists.linux.dev>; Sat, 12 Aug 2023 04:03:21 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5231410ab27so3289232a12.0
        for <imx@lists.linux.dev>; Fri, 11 Aug 2023 21:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691813000; x=1692417800;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xhhla1+LTJ7qybj+L7Zn8ynSGC7/+dd5k7FrBOxFAFY=;
        b=YzIcsrVUjhjokQYXrrp0ES3JekvdWc9Jo1uw1NnqDafz3G0xGnACwd71b3Ks2LK2zh
         II1OE0YkXY0d8ku2OM8Ze2UbsoNSL3ujFsXu0Kfqzop6/KxEGyXCryMb38C1V2rU2b/M
         uec3y8v1O7Iw/N2quZG5cEPc/nfs3azjuG/h0PrDNrZ+92ZIkZ//t0MpXvLarFly7Gg3
         k/nXf4wky+bXcc3tvyriE1JEbqtO1h2no5+XSPywkszERpNjwl5a18NuNkr0LVsjdme5
         DTGcoxajqIkmhBzMG7ovtA+f3U4nbvtkbJalxkJevhjZERGw/I7IeNxwpuzycukmrqRd
         nEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691813000; x=1692417800;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhhla1+LTJ7qybj+L7Zn8ynSGC7/+dd5k7FrBOxFAFY=;
        b=T5GWDs7/L9fo+k2skVeUNibfNangp7ylRo5sZRnHH7x+4HCsN5wEfzURbaZe7v+sZj
         THqdbuUpPlVtcS/79RkOzlSJywW93QPRag4tX8ACjxHiRnLmz7WBn5z/r8PDmqjeEKDj
         X7CRruzJTK2ECROc9ufoikr75/vYwdSVN6wkdHqcbE22hHPHkgYp/wS+8TKg5/8Ed/cG
         bcuGCjHUlWOlDcL/j4n079vp4h+qVJUlTLwmrsdrZtsVVA0eZJ12krSkQwb/rrgBHVr8
         zZxam9LKga0s0XFVxiCTDrNVRCClZW7NVtS3okoxG+6WBHJIPsxwG38DLh1tkns13hZ6
         jV5Q==
X-Gm-Message-State: AOJu0Ywl5oHSp5Dxdyuv4Q0Csf5UMxIfyafY8NiRndwQ/GeBpMFmgFtW
	STnUpuM5b+6EZ3B9yOi4vcWZ+vNnJOTT8s+ztiYBlUsHbbk=
X-Google-Smtp-Source: AGHT+IHPWP6cHq38h5HS/y1ibNclnpfi4ffqPgxCW35OLYMDXwFt0Mhuc1LhiTs35BdkSDf9qJosGapcJFKRGW5RJeQ=
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a50:d4cc:0:b0:522:3410:de23 with SMTP id
 e12-20020a50d4cc000000b005223410de23mr2441879edj.3.1691812999990; Fri, 11 Aug
 2023 21:03:19 -0700 (PDT)
Received: from 170827741999 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Aug 2023 21:03:19 -0700
In-Reply-To: <'CAC5d1WLA9UYH6=zxyz9hRNuX2Z4ZZGS=D9LNn+jkbyRc1RrtoA@mail.gmail.com'>
References: <'CAC5d1WLA9UYH6=zxyz9hRNuX2Z4ZZGS=D9LNn+jkbyRc1RrtoA@mail.gmail.com'>
From: harrynicomama@gmail.com
Date: Fri, 11 Aug 2023 21:03:19 -0700
Message-ID: <CAC5d1WKq6Z0NqC2=SKd4OE5-DJMw_97Y1Dxm4NABa2Y7Z6gdCA@mail.gmail.com>
Subject: Quick Reply Extension Testing
To: harrynicomama@gmail.com
Cc: extensiontest66@gmail.com, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> > Browser extension test thread for quick email replies.
> >
> > Please Ignore.
>
> Testing quoting and email system.

Testing quote structure.

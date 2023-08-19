Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFF017724
	for <imx@lists.linux.dev>; Sat, 19 Aug 2023 17:31:45 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-51e2a6a3768so2534874a12.0
        for <imx@lists.linux.dev>; Sat, 19 Aug 2023 10:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692466303; x=1693071103;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YMYA0cg64BQyDm5NOS1dU1yImyGfpy5Qlu1CmoIhYUk=;
        b=ndpd0FlecHO+EXM+KtuivXaNVOB6kvSKxCj4ZK2KnLJNfB/lve5HOxEOrl2oK2YjNh
         Sajceg+lLTnDV/u93nTB5Oty3sZkfmuvs6slk4TSpkyBoTTrz1sAT17riNetKCOw/OGy
         1ByVlZt1auh7rrF2pbMxGn72H5O55bEPerra+HxFGLjwbX8iK+DuJ7/a+22VS5W81I3g
         AvQpeJc2Q4CHXusaz5BldK1bJOXchG3W0k1wpC5Sv4q50N8HdcQpFKqM+5PcAke79XRa
         vWqU94yFWTrDzVrbirBWcxlml2NV2f7/PXVRyCYjCkSBJIFNfBFZwHYayBuCWhifn0bZ
         qG0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692466303; x=1693071103;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YMYA0cg64BQyDm5NOS1dU1yImyGfpy5Qlu1CmoIhYUk=;
        b=exjn2mWCjD0dK6bkELI2akvBJFyjlthTZ2k6V4nUyCf7V2DgCTD/YBpz1nIqtddKc/
         Xw76XnO3SXuNCMFWXd4C9lE+eAICHJIXhRNGxASF5A8cir9Et2GtewSXi7tI0UX3UxXz
         tK3vYAPAyf8Ev6mJ1kqbb/WmcJy4l2xvcXKjIfKUqRXFV6wAHLw95yjlhL2S7LHhp5e7
         kViscNHwzgSyLr2CLdSVRGufsgIQ5f0YBtMr/Sxg2iRhmK/n3KfHrAzBedrmSqoGOC2R
         PeE1fW1LgFQrFJ8rO5nQ8VLBSWQsuwiHiaV2CDv4PtvIW/GtM1z0RIywF3E90qQSaAPC
         4Fmw==
X-Gm-Message-State: AOJu0YyH3idrTvYklfJMokE5do+wESTF3yd1AZhd1dE7D1iBL8OYGdsz
	Y/v8CsJpcuv5muK1jW0e3icspRWvvhC237U2LBQ=
X-Google-Smtp-Source: AGHT+IHc7LY7BU/ALXrc83v9PULeqtaPOdErFlTv5edoQNtOrCR44AaS7TuKCj/NH8PvRGiMJhC9zf7sORZIljuCJF8=
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:aa7:ccc9:0:b0:523:1ea3:b9a6 with SMTP id
 y9-20020aa7ccc9000000b005231ea3b9a6mr1666343edt.39.1692466303286; Sat, 19 Aug
 2023 10:31:43 -0700 (PDT)
Received: from 170827741999 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 19 Aug 2023 10:31:42 -0700
From: Qi Wang <harrynicomama@gmail.com>
In-Reply-To: <CAC5d1W+oAF1Vjipo1TZC8RavxjoLvo3G60Um5N6Qb9ZrODSbvw@mail.gmail.com>
References: <CAC5d1W+oAF1Vjipo1TZC8RavxjoLvo3G60Um5N6Qb9ZrODSbvw@mail.gmail.com>
Date: Sat, 19 Aug 2023 10:31:42 -0700
Message-ID: <CAC5d1WLtuB=6NDG_B3wFhtoyM_XDALMBdBFJt8DD1EjLQaRtQQ@mail.gmail.com>
Subject: RE: [EXT] Quick Reply Extension Testing
To: harrynicomama@gmail.com
Cc: extensiontest66@gmail.com, imx@lists.linux.dev, shenwei.wang@nxp.com
Content-Type: text/plain; charset="UTF-8"

> testing api


type your response here

==============================
Replied with love by Quick Reply Extension
https://github.com/HarryWangATX/quick-reply-extension

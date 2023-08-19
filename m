Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD044A16
	for <imx@lists.linux.dev>; Sat, 19 Aug 2023 16:18:57 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-51cff235226so3976629a12.0
        for <imx@lists.linux.dev>; Sat, 19 Aug 2023 09:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692461935; x=1693066735;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=omoeDDjxLFLkBAnPHKFbmOyy0oGYTV2fvOTRc0R00Yo=;
        b=rf6VeeTLfGsSUJWSNy/CrnFi4nRIt6AklMj0pV5Grig9ewGKChu411tQkQbUFhnkq1
         r8YaqxsjdICtskAgGRMYSroeGEyR5Xo31ZCYPI2e/8MI5zkXZxzeJev3gaF2ExlHX825
         i3QUfaevsL2ptJ/h9GXyNWR3ldeqQcW67ySajQB95EMFhCKv0jMFQVYWLTA1IYLQUcUI
         DKMGtQX+aFTJzGtcMmv+45jzr+5h/+ZTzktHQq1lBtI2gWJUA4IVshPxGJUIR9HH2dBs
         WzMAH4SqVYT5lMDw2Kc+vYrXash2pIcaE9/HSkwP27A+3AHQdcgUGhfZe9i9BwROuLwh
         qDoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692461935; x=1693066735;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=omoeDDjxLFLkBAnPHKFbmOyy0oGYTV2fvOTRc0R00Yo=;
        b=QQiUR5R7fVTTiYEs3qKkyReDrsgkugcOFo/Tlv6R5zX9S73bgGAGezeMbOHpLPKRJm
         idUqk5/9AgOytQZMTL3OeQiOTB3HGQc1lg10EWYUjqwqMBmpDffgWuXtYryLUrYY7Ku9
         5aicYqwJjvU6pFuGGHI4CLYPBvjH+WGa+zzym/kRuIMKJ7E93Kthw02a6CZVpy5TXPQ6
         xymlHora8jvhc1y2ZZhi2qHUpaIpG4pvV8GEFaRTZTpz1NWhQCKW8KQfCxq67K55OmkU
         zqAzvYkGlYuOW2GwXzR67vE2ZjwFnECgiJAmBBCT9cZ9OeA5Nl7J9EmGe/dJ4v2z3sWQ
         0fSw==
X-Gm-Message-State: AOJu0Yxlo/OkinWDLvnK8iQpANA9n8xWj21uPb9cS+Qt5pyixZtLklYs
	6AtfW1CRkHnufX1AuEEufCuVhg4PH8Wo1LF/JWf+I+kGXwU=
X-Google-Smtp-Source: AGHT+IE93q/DEPfk++a71pGiJexUYnyDqUPHyRAH13olyEHynjL8DtcRaYx0hqG4XkNqRirmWJbyqRR+tn8jYwWEDTQ=
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6402:11c8:b0:51e:5bd5:fe7e with SMTP id
 j8-20020a05640211c800b0051e5bd5fe7emr2568207edw.17.1692461935203; Sat, 19 Aug
 2023 09:18:55 -0700 (PDT)
Received: from 170827741999 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 19 Aug 2023 09:18:54 -0700
From: Qi Wang <harrynicomama@gmail.com>
In-Reply-To: <CAC5d1W+oAF1Vjipo1TZC8RavxjoLvo3G60Um5N6Qb9ZrODSbvw@mail.gmail.com>
References: <CAC5d1W+oAF1Vjipo1TZC8RavxjoLvo3G60Um5N6Qb9ZrODSbvw@mail.gmail.com>
Date: Sat, 19 Aug 2023 09:18:54 -0700
Message-ID: <CAC5d1WK9mP+AfHrZGddcGf5yYVr5Qc2C-m8e4SeqhOQU8UQt0Q@mail.gmail.com>
Subject: RE: [EXT] Quick Reply Extension Testing
To: harrynicomama@gmail.com
Cc: extensiontest66@gmail.com, imx@lists.linux.dev, shenwei.wang@nxp.com
Content-Type: text/plain; charset="UTF-8"

test

==============================
Replied with love by Quick Reply Extension
https://github.com/HarryWangATX/quick-reply-extension

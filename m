Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328B2809
	for <imx@lists.linux.dev>; Sat, 19 Aug 2023 03:43:31 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5230a22cfd1so1984593a12.1
        for <imx@lists.linux.dev>; Fri, 18 Aug 2023 20:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692416610; x=1693021410;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wqQua5J2/1VUrhLz2HVyLp9D9DcVkC9jPNJYNJmTcz0=;
        b=Rf0P+T0J7edd2KYWGFD59SXtUmSp6QaKTHvi71UKvDqgW8aJj00ExrnTNqLLZWyx6Q
         Cog+Bt9xt4s5M3T877bZD7xWeG34lH8OH35OOH6C6C+CVR6qJ/4jxIWwYw3l7lADQ203
         d5BCEwn0Znifb/BVORnnDP2WXHvyQXtSqVm2jSG3cM2oqOtq/RelwjenN0ZZbVY4J6HI
         jSafu5h1O23NB6T9Yaaj3he1snARHmMpdegaDej+eeLdF5nLPHup7Y+v1Uo0i9ev2ZUh
         3fyoSsErwBDq5jVD8JqcjIWGI5oqLQF5KhFs6VS2xkH4VWFiLCdbKlska992jDy8hsJ1
         jruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692416610; x=1693021410;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wqQua5J2/1VUrhLz2HVyLp9D9DcVkC9jPNJYNJmTcz0=;
        b=LEbqkn9qQHf2HaCF5ZQM+NQbwV6cJSVn2SB4QJhKvIzQ2IgKqUbT0PzKzWQ65hTAVP
         RB/28kg5GXliROwQ3GfPbRd/ncSJwzruXRlW10aIcELupzMTOkEnfpJYP4P9JL7LzMDM
         xIjZWIgMTkQ74nXmMtk2paY2qScJkDdgk4dPSdxe5HMa7ovbkWJgjbSDUwz3qjRr5rny
         LyiB9jXcoYXlt/drtAQP9YExaZAbkjDKw0uKCaN2lzKjK7H5xKngbRDWpYP+oBrp00Tv
         qh8YkJ/IwzyKpYOMumv7xCW0+x5Uzy2bYBNNjP0pPU/R2trNszv5v600tEmnHPhX1WIo
         9+Bw==
X-Gm-Message-State: AOJu0Ywldpr+FlfdeZptTUGxt1Vx9HxAFlDcyHN41s+lm070izrXCfbI
	XycZR/70XPgobn+1U5fJFpf+nw/ybMAjglUZ330jzasynD4=
X-Google-Smtp-Source: AGHT+IGzanScr0T2ABqjcAwE3XcqerUJOcJNucTZ6p58vpJ6ZSa7scfX92yCpbJCNrVX7bKErhz2Pl0Y5/G5Yz89FZk=
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:aa7:d9cd:0:b0:523:4025:49f0 with SMTP id
 v13-20020aa7d9cd000000b00523402549f0mr643867eds.26.1692416609955; Fri, 18 Aug
 2023 20:43:29 -0700 (PDT)
Received: from 170827741999 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Aug 2023 20:43:29 -0700
From: Qi Wang <harrynicomama@gmail.com>
In-Reply-To: <CAC5d1WKzudMYnfXpGFrbNAucB7KawMBMDZkiigZpbyX2YE0xng@mail.gmail.com>
References: <CAC5d1WKzudMYnfXpGFrbNAucB7KawMBMDZkiigZpbyX2YE0xng@mail.gmail.com>
Date: Fri, 18 Aug 2023 20:43:29 -0700
Message-ID: <CAC5d1WKGSaJsnpierhwZ_gih17XUO6MYe-pXki5o0gsWQrvR-w@mail.gmail.com>
Subject: RE: [EXT] Quick Reply Extension Testing
To: harrynicomama@gmail.com
Cc: extensiontest66@gmail.com, imx@lists.linux.dev, shenwei.wang@nxp.com
Content-Type: text/plain; charset="UTF-8"

> > test header bug fix
>
> testing buttons
>
> Acked-by: Qi Wang <harrynicomama@gmail.com>


Testing async calls.

Acked-by: Qi Wang <harrynicomama@gmail.com>


==============================
Replied with love by Quick Reply Extension
https://github.com/HarryWangATX/quick-reply-extension

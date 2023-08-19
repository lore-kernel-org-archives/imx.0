Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F70641
	for <imx@lists.linux.dev>; Sat, 19 Aug 2023 00:30:03 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2b9c907bc68so24576001fa.2
        for <imx@lists.linux.dev>; Fri, 18 Aug 2023 17:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692405001; x=1693009801;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h+sZhJJfLD66VD7ryQQR7vYQ6XhgesfrMtx4sPwjSPQ=;
        b=Tgo+kbYWfBDy+a1J+E0+DRCoBwvzs4lRKKOR4nlzS3eaK6oHIRxCANv3zKJBLv51Wh
         hEZSlqOjOcRTP+FeqDaRmNpvNChP+G/EuBhdBp+Li3dWG8/4N3qgWKWnT6r3rsjox60A
         Pderf8e0RXP5Z1XCFfCQx4Cg/sHl81bB8j9tSY1/X7OAgQJ14TU86ji+QN8VWXHiMgMi
         tmgbqehHnL/fIOS+ne+ahTdWarOYPnh/f5isQcAu5Orov1iVGr/vgHpLz1GHGmWFgETb
         n8BypMaxScjimV7qzyD6JOAu6CLBYBE1iWDpaHSpTWVMLWBi+Ya76o57blkLYlPHuFko
         RT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692405001; x=1693009801;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h+sZhJJfLD66VD7ryQQR7vYQ6XhgesfrMtx4sPwjSPQ=;
        b=lkg5KTvInFTpETnEIalvjhVeEPzETieE2Cff2lJOvZKiLhatgLYO3MuSyveHHskUf+
         b5j1RbNj7w6YYY97bd9oYYzeAMjJsrvtxMD2pfBOvpLhRq5355av/07TSan2hyhR9Okh
         a0PiRb4C1vCVTLhwSM5Tq51AyEcTJ72ogVymjWjfokBJzJqEEp4Y7UuoVdYaxhuoVtH8
         Nvf5BdNJimp7MONj8U4Z75PxP6a5iQ9+rMh+HXK5KcoYxv4qzn+hoV32oNHUt1gEdksP
         6ynzDzPH+BzqockI5T3FEaPvCD1x/JCn1RGm0Oa/Ae0aiuitLH5uRBURuW5CD4/yAyql
         vHVg==
X-Gm-Message-State: AOJu0Yz+q7bI+6ZDmTOETVtvq5B+7yQpYWOkXcg4aZb/glYr9lHRuqAZ
	S0DTLzbEVi7k4KaF00nIrXM460LGyPBNAFB/EHE=
X-Google-Smtp-Source: AGHT+IEAtyrB5M7v53Ia8sdjcJlHcT0rjDA1uaxYuWljxScqcwOGNgFdYdqbVF68Mm8FcIXINIzGT5t1ftDiK59YZ0k=
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6512:3191:b0:4fb:9f93:365f with SMTP id
 i17-20020a056512319100b004fb9f93365fmr490246lfe.38.1692405001002; Fri, 18 Aug
 2023 17:30:01 -0700 (PDT)
Received: from 170827741999 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Aug 2023 17:30:00 -0700
From: Qi Wang <harrynicomama@gmail.com>
In-Reply-To: <CAC5d1WLczUTOP8GOg2uUdxXVGOZ_ihSFjeXBu3X7VDBTLD-gmQ@mail.gmail.com>
References: <CAC5d1WLczUTOP8GOg2uUdxXVGOZ_ihSFjeXBu3X7VDBTLD-gmQ@mail.gmail.com>
Date: Fri, 18 Aug 2023 17:30:00 -0700
Message-ID: <CAC5d1WKO1wnW3bNrTpJqRrJN1JryRuAPsjDmCX3rL5C-NEwFLg@mail.gmail.com>
Subject: RE: [EXT] Quick Reply Extension Testing
To: harrynicomama@gmail.com
Cc: extensiontest66@gmail.com, imx@lists.linux.dev, shenwei.wang@nxp.com
Content-Type: text/plain; charset="UTF-8"

> test header bug fix

Testing acknowledge and review.

Acknowledged by: Qi Wang <harrynicomama@gmail.com>

Reviewed by: Qi Wang <harrynicomama@gmail.com>


==============================
Replied with love by Quick Reply Extension
https://github.com/HarryWangATX/quick-reply-extension

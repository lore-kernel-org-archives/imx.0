Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC8D1100
	for <imx@lists.linux.dev>; Sat, 19 Aug 2023 03:45:41 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-528913c261bso1605175a12.1
        for <imx@lists.linux.dev>; Fri, 18 Aug 2023 20:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692416740; x=1693021540;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kkzODBgPagQ2qFeRhNwzfTBM4fNjK2dY6eqTlnC4wEQ=;
        b=GpZHKvN5iY2mfUEbThEF+bSdGWlSIHJDwKNz/WNvSDARdYluMxGPtitUD3w0WcF3XO
         3CX6zJOBBmJNvbjw9aaoC2bOpeLQltJP3Y3mg4DrtiYDN1po6T8+SG8qLYtIRhlrkhOJ
         yhYjdXfhPDBWTDadV962oqa/O0sxmFHbqK0torHeSW8hPvG2u308itKyOoS8Ov4bq1+F
         O8C5PmSe39GoUzvLhDbcjExV1kP+PMQ83+tnkBaWgk7vhCbFsHOavNd/tZqJbQ0kGx9N
         ebcwXPkTNoKe9C4huCJ4ToMfUk3dZMQolgLBaNeFelFZU4J9I+N9Wa20TiHj697dNRcV
         pRpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692416740; x=1693021540;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kkzODBgPagQ2qFeRhNwzfTBM4fNjK2dY6eqTlnC4wEQ=;
        b=csfqHwrEs9Tb597WyqJAPiM05Fn7yBB8rz1rsOR5JMytP6ITUQMLAwXTgWmjp7DdN8
         7KfzNCv1uo29RKvaR2mQRCL0s59b1btxlQ8qE1rW4019dZR4LGoVROLgXpNZvCeXF3TK
         PFzy3xOAvvzwEktKLotdbV3oR2mnWzggUTaGwRAPi8vqbzm4jDq3pMMfh9qTnh0izpYE
         FY4/UtBT3JbZrkqctGWl/oeob4FGQey6CvE8dyHGN5aGomxqAaaP6oBhL/1vVdAszeJd
         psCk8qsMfMYKItl8HTg3xRMcvRRWy1KIeV6qz4ZX0uQ90vdcPxY4OE8CvIBS8QPsxicp
         z7HA==
X-Gm-Message-State: AOJu0YwchObV8geuPU7TChUTqAxuPEt+pULNXSia4sq1ue4krGg9+QVC
	SUHQBrdHaHwE8neRy2y6TWfCpTSvwUh4BtHFzvcsNEwpJF0=
X-Google-Smtp-Source: AGHT+IHp+CQKWoWGGAdFyuzGEpwYFq+dH0kBMPud9mllXUTriaqLX8x4QQFrU4YhFAUz8RFnLn6f4oeRWBaWdyyw6lE=
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a50:e712:0:b0:528:90d7:a19 with SMTP id
 a18-20020a50e712000000b0052890d70a19mr785043edn.11.1692416740044; Fri, 18 Aug
 2023 20:45:40 -0700 (PDT)
Received: from 170827741999 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Aug 2023 20:45:39 -0700
From: Qi Wang <harrynicomama@gmail.com>
In-Reply-To: <CAC5d1WKzudMYnfXpGFrbNAucB7KawMBMDZkiigZpbyX2YE0xng@mail.gmail.com>
References: <CAC5d1WKzudMYnfXpGFrbNAucB7KawMBMDZkiigZpbyX2YE0xng@mail.gmail.com>
Date: Fri, 18 Aug 2023 20:45:39 -0700
Message-ID: <CAC5d1W+oAF1Vjipo1TZC8RavxjoLvo3G60Um5N6Qb9ZrODSbvw@mail.gmail.com>
Subject: RE: [EXT] Quick Reply Extension Testing
To: harrynicomama@gmail.com
Cc: extensiontest66@gmail.com, imx@lists.linux.dev, shenwei.wang@nxp.com
Content-Type: text/plain; charset="UTF-8"

testing api

==============================
Replied with love by Quick Reply Extension
https://github.com/HarryWangATX/quick-reply-extension

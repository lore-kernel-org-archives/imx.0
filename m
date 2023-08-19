Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743B7111A
	for <imx@lists.linux.dev>; Sat, 19 Aug 2023 03:51:04 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-523b066d7ceso1856070a12.2
        for <imx@lists.linux.dev>; Fri, 18 Aug 2023 20:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692417062; x=1693021862;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZuYSgLHT3MoqhGNrbgDBeVIF5TSOMRtuMod209QNTyA=;
        b=FJ3shT2vpl/f/M3aG6Tlr7Poa0/0A23lknPX5wErMXzEsyoD9EwzUM6SsAsl3m5z97
         gjKRySpBg9LDA/enDc+DwrIGvAI49MYXzUBho1+1gEqeXoVakjhavbyRjWOo94YRf0iU
         KthX5v4dLzgqgNbCOHmp6pSAWdOtDyRGUBzdrmkQ19edOEzq/2/YjfHujFKbwkUb9VMT
         X1BqpmHQLCk3SaATL/x1wLGXrVRzGkE7okblBPV6PB1xaFBi++dTZ9Gde3xHRF/wVnXK
         QgEC5+RxCe+8Ytj2SSkESLNWbcQWMs9ZaHBDEHp6qxOlADqeycFY+c5P0aG3u00pkx40
         Dsog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692417062; x=1693021862;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZuYSgLHT3MoqhGNrbgDBeVIF5TSOMRtuMod209QNTyA=;
        b=DDSlWhYCddZLaL0mFYk5PARruiL3mkzKXicuphnQ5jGinO2pgiiHNpyWKw4eBNGdfc
         bngm0/6ohTB4spAk01nRKW6fT06UqJihD/DHDDaoQXuh2QH5mCCuhjvnec/pmRbQae1Z
         MW1YtkZAQXao4tsfm5eT3tHtRwq8KUEyRa7w1Ug+zLaTySsK4e0lbmK781KJKUPDhwAM
         mDvdU7IyDkADa9HNode2PbbWv5N9daVMesiukuxrBl2qoewhA+ysjvH/AewfNARTe5hS
         HFkquqGkZoV7ekNrMsgA7lsiyy2bTRnGFv3WJXhT0ZdO3e27GLzOh76biy0Bf22S5V8l
         KkGg==
X-Gm-Message-State: AOJu0YzXKeKLPuKmfjzwsUgwfhZfy6zidticbQvic8Wsa6e6tGIsNtXQ
	lt9xgBRW9c4NuaRw5VyDBOPtjkbYE/4OEM9TkK3bXr06cVs=
X-Google-Smtp-Source: AGHT+IHY7KgKqw8R7ce3Js89WN1zvI8mxYVrieXtBcDBdfwUtuG9rHeJ2kuMySVeBPb7p3/9F5es4HhsWfrlaGQG4OY=
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:aa7:c391:0:b0:525:5a65:6dfa with SMTP id
 k17-20020aa7c391000000b005255a656dfamr757890edq.14.1692417062333; Fri, 18 Aug
 2023 20:51:02 -0700 (PDT)
Received: from 170827741999 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Aug 2023 20:51:02 -0700
From: Qi Wang <harrynicomama@gmail.com>
In-Reply-To: <CAC5d1WKzudMYnfXpGFrbNAucB7KawMBMDZkiigZpbyX2YE0xng@mail.gmail.com>
References: <CAC5d1WKzudMYnfXpGFrbNAucB7KawMBMDZkiigZpbyX2YE0xng@mail.gmail.com>
Date: Fri, 18 Aug 2023 20:51:02 -0700
Message-ID: <CAC5d1W+NRdK06Mu9b4c=6gZtdfzJKE7tOWTwWDvMwKfrhfH96Q@mail.gmail.com>
Subject: RE: [EXT] Quick Reply Extension Testing
To: harrynicomama@gmail.com
Cc: extensiontest66@gmail.com, imx@lists.linux.dev, shenwei.wang@nxp.com
Content-Type: text/plain; charset="UTF-8"

test 4

==============================
Replied with love by Quick Reply Extension
https://github.com/HarryWangATX/quick-reply-extension
